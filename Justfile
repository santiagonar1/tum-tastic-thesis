root := justfile_directory()

export TYPST_ROOT := root

[private]
default:
    @just --list --unsorted

[private]
init:
    @mkdir -p build

test *filter:
    tt run {{filter}}

update-test *filter:
    tt update {{filter}}

build: init
    typst compile template/main.typ build/main.pdf

thumbnail:
    typst compile thumbnail.typ thumbnail.png

package target *options:
    ./scripts/package.sh "{{target}}" {{options}}

install target="@local":
    ./scripts/package.sh "{{target}}"