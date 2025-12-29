root := justfile_directory()

export TYPST_ROOT := root

[private]
default:
	@just --list --unsorted

[private]
init:
    @mkdir -p build

test: init
    typst compile template/main.typ build/main.pdf

build: test