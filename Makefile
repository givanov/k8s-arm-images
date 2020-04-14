DIR := ${CURDIR}
DIRECTORY = $(wildcard */)

.PHONY: init
init:
	helm plugin install $(HELM_PLUGIN_DIFF_URL) --version $(HELM_PLUGIN_DIFF_VERSION) || echo "Plugin already installed - nothing to do"
	helm repo add stable https://kubernetes-charts.storage.googleapis.com/
	helm repo update

.PHONY: push
push: $(addsuffix -push,$($*DIRECTORY:/=))

.PHONY: %-push
%-push:
ifneq ($(wildcard $*/.),0)
	@echo "*Buiding and pushing $*"
	@$(MAKE) -C $* push
endif

.PHONY: build
build: $(addsuffix -build,$($*DIRECTORY:/=))

.PHONY: %-build
%-build:
ifneq ($(wildcard $*/.),0)
	@echo "*Building $*"
	@$(MAKE) -C $* build
endif