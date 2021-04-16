MAKEFLAGS += --silent

.DEFAULT_GOAL := validate

## Initialize terraform remote state
init: 
	[ -d .terraform ] || terraform $@

## Pass arguments through to terraform which require remote state
apply console destroy graph plan output providers show validate: init
	terraform $@

## Pass arguments through to terraform which do not require remote state
get fmt version:
	terraform $@

.PHONY: test
test:
	[ -f ./test/test.sh ] && ./test/test.sh || true

clean:
	rm -rf rm -rf .terraform *.tfstate

-include include.mk
