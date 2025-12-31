root := justfile_directory()

export TYPST_ROOT := root

[private]
default:
    @just --list --unsorted

[private]
init:
    @mkdir -p build

test *filter:
    just install @preview
    tt run {{filter}}

update-test *filter:
    tt update {{filter}}

build: init
    typst compile template/main.typ build/main.pdf

thumbnail:
    typst compile -f png --pages 1 --ppi 250 thumbnail.typ thumbnail.png
    oxipng -o 2 --strip safe --alpha thumbnail.png

package target *options:
    ./scripts/package.sh "{{target}}" {{options}}

install target="@local":
    ./scripts/package.sh "{{target}}"