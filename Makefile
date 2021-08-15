MAKEFLAGS += --silent

.DEFAULT_GOAL := validate

.PHONY: help init apply console destroy fmt get graph import output plan providers refresh show taint untaint validate version workspace

## Initialize terraform remote state
init: setup
	[ -d .terraform ] || docker-compose run --rm --user "$$(id -u):$$(id -g)" terraform $@ -upgrade $(ARGS)

## Pass arguments through to terraform which require remote state
apply console destroy graph plan output providers show validate: init
	docker-compose run --rm --user "$$(id -u):$$(id -g)" terraform $@

## Pass arguments through to terraform which do not require remote state
get fmt version:
	docker-compose run --rm --user "$$(id -u):$$(id -g)" terraform $@

.PHONY: setup
setup:
	k3d cluster ls k3s-default || k3d cluster create -c k3d.yaml
	kubectl cluster-info

.PHONY: test
test:
	[ -f ./test/test.sh ] && ./test/test.sh || true

.PHONY: clean
clean:
	k3d cluster delete
	rm -rf .terraform *.tfstate

-include include.mk
