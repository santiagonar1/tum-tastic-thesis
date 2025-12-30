#!/usr/bin/env bash
set -eu

SCRIPT_DIR="$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"

if (( $# < 1 )) || [[ "${1:-}" == "help" ]]; then
  echo "package TARGET [--relative-paths] [--version VERSION]"
  echo ""
  echo "Packages all relevant files into a directory named '${PKG_NAME}/<version>'"
  echo "at TARGET. If TARGET is set to @local, the local Typst package directory"
  echo "will be used so that the package gets installed for local use, if @preview"
  echo "is used, Typsts preview cache dir will be used."
  echo "The version is read from 'typst.toml' in the project root."
  echo ""
  echo "Local package prefix: $DATA_DIR/typst/package/local"
  exit 1
fi

function read-toml() {
  local file="$1"
  local key="$2"
  # Read a key value pair in the format: <key> = "<value>"
  # stripping surrounding quotes.
  perl -lne "print \"\$1\" if /^${key}\\s*=\\s*\"(.*)\"/" < "$file"
}

PKG_ROOT="${PKG_ROOT:-${PWD}}"
if [[ ! -f "$PKG_ROOT/typst.toml" ]]; then
  echo "Could not find typst.toml at PKG_ROOT ($PKG_ROOT)!"
  exit 1
fi

PKG_NAME="$(read-toml "$PKG_ROOT/typst.toml" "name")"
if [[ -z "$PKG_NAME" ]]; then
  echo "Could not read 'name' from $PWD/typst.toml!"
  exit 1
fi

PKG_VERSION="$(read-toml "$PKG_ROOT/typst.toml" "version")"

# List of all files that get packaged
files=(
  src/
  template/
  typst.toml
  LICENSE
  thumbnail.png
  README.md
)

# Local package directories per platform
if [[ "$OSTYPE" == "linux"* ]]; then
  DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  DATA_DIR="$HOME/Library/Application Support"
else
  DATA_DIR="${APPDATA}"
fi
DATA_DIR="${TYPST_PACKAGE_PATH:-${DATA_DIR}/typst/packages}"

TARGET="${1:?Missing target path or @local}"; shift

OPT_RELATIVE_PATHS=false
while [[ $# -gt 0 ]]; do
  case "$1" in
    --relative-paths)
      OPT_RELATIVE_PATHS=true
      shift
      ;;
    --version)
      shift
      PKG_VERSION="$1"
      shift
      ;;
    *)
      echo "Unexpected option $1!"
      exit 1
      ;;
  esac
done

echo "Package root:    $PKG_ROOT"
echo "Package name:    $PKG_NAME"
echo "Package version: $PKG_VERSION"

if [[ "$TARGET" == "@local" ]] || [[ "$TARGET" == "install" ]]; then
  TARGET="${DATA_DIR}/local/"
elif [[ "$TARGET" == "@preview" ]]; then
  TARGET="${DATA_DIR}/preview/"
fi

echo "Install dir: $TARGET"

TMP="$(mktemp -d)"

for f in "${files[@]}"; do
  mkdir -p "$TMP/$(dirname "$f")" 2>/dev/null
  cp -r "$PKG_ROOT/$f" "$TMP/$f"
done

TARGET="${TARGET:?}/${PKG_NAME:?}/${PKG_VERSION:?}"
echo "Packaged to: $TARGET"
if rm -rf "${TARGET:?}" 2>/dev/null; then
  echo "Overwriting existing version."
fi

if $OPT_RELATIVE_PATHS; then
  echo "Changing imports to relative."
  "$SCRIPT_DIR/relpaths.py" "$TMP"
fi

mkdir -p "$TARGET"
mv "$TMP"/* "$TARGET"
