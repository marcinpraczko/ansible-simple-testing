# ============================================================================
# Based on page:
#   https://gist.github.com/prwhite/8168133
# ============================================================================

AT_DOCKER_PREFIX ?= ""

.PHONY: help
help: ## HELP: Show this help message.
	@echo 'usage: make [target] ...'
	@echo
	@echo 'Targets:'
	@echo '========'
	@egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'


.PHONY enable_sudo:
enable_sudo: ## INIT: Enable sudo for all docker commands (some systems required this)
	@echo "Please run 'source sudo_enable.sh' script"

.PHONY disable_sudo:
disable_sudo: ## INIT: Disable sudo for all docker commands (some systems required this)
	@echo "Please run 'source sudo_disable.sh' script"

.PHONY: clean
clean: ## CLEAN: Clean workspace - remove all temporary files / folders / etc.
clean: done
	rm -rf ansible-1
	rm -rf *.retry

.PHONY: init
init: ## TEST: Initial configuration  - run grafana services (different versions)
	${AT_DOCKER_PREFIX} docker-compose up --detach && echo
	${AT_DOCKER_PREFIX} docker-compose images && echo
	${AT_DOCKER_PREFIX} docker-compose ps && echo

.PHONY: test
test: ## TEST: Test01 - Import grafana dashboard via ansible with fix.
	./test.sh

.PHONY: done
done: ## TEST: Finish testing - stop all services
	${AT_DOCKER_PREFIX} docker-compose down

.PHONY: versions
version: ## INFO: Dump details about versions to local file
	./versions.sh
