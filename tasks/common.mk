.SILENT:

ECHO?=echo
NOP?=$(ECHO) >> /dev/null
CURL?=curl
HTTP_POST?=$(CURL) -XPOST -f -L
HTTP_DELETE?=$(CURL) -XDELETE -f -L
NPM?=npm

node_modules:
	$(NPM) install

.PHONY: build
policy.build: command.exist.$(NPM) node_modules ## Policy Build
	$(NPM) run asbuild

.PHONY: help
help: ## Shows this help
	@echo 'Usage: make <target>'
	@echo ''
	@echo 'Available targets are:'
	@echo ''
	@grep -Eh '^\w[^:]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-50s\033[0m %s\n", $$1, $$2}' \
		| sort

.PHONY: command.exist.%
command.exist.%: MSG?=[ERROR] $* not found in PATH
command.exist.%:
	@which $* > /dev/null || { echo '$(MSG)'; exit 1; }
