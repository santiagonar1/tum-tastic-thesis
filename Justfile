root := justfile_directory()

export TYPST_ROOT := root

[private]
default:
    @just --list --unsorted

[private]
init:
    @mkdir -p build

test *filter:
    tt run {{filter}} --use-system-fonts

update-test *filter:
    tt update {{filter}} --use-system-fonts

build: init
    typst compile template/main.typ build/main.pdf