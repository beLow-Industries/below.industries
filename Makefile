DOCKER ?= docker

help: ## show this message
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@grep -E '(^[a-zA-Z0-9_%-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-20s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
	@echo ""
	@echo "Env:"
	@grep -E '^[a-zA-Z0-9_-]+\s*[?:]?=.*$$' $(MAKEFILE_LIST) | grep -Eo '^[a-zA-Z0-9_-]+' | xargs -I {} make -s print-{}
.PHONY: help

print-%:
	@echo -e '\033[32m$*\033[0m = $($*)'
.PHONY: print-%

clean: ## delete any build
	rm -rf build
.PHONY: clean

jinjapocalypse:
	git clone https://github.com/mortrevere/jinjapocalypse

build: jinjapocalypse ## build project
	$(DOCKER) build jinjapocalypse -t jinjapocalypse
	$(DOCKER) run --rm -u $(id -u):$(id -g) -v ${PWD}:/jinjapocalypse jinjapocalypse
