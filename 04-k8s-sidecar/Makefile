DOCKER_REPO := quay.io/givanov/k8s-sidecar-armhf
VERSION := 0.1.75

.PHONY: build
build:
	@docker build \
	  --build-arg VERSION=$(VERSION) \
	  --build-arg GO_BUILDER_VERSION=$(GO_BUILDER_VERSION) \
	  -t $(DOCKER_REPO):$(VERSION) .

.PHONY: push
push: build
	@docker push $(DOCKER_REPO):$(VERSION)