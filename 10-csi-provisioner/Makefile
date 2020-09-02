DOCKER_REPO := quay.io/givanov/csi-provisioner-armhf
VERSION := v1.5.0 
GO_BUILDER_VERSION := 1.14.2

.PHONY: build
build:
	@docker build \
	  --build-arg VERSION=$(VERSION) \
	  --build-arg GO_BUILDER_VERSION=$(GO_BUILDER_VERSION) \
	  -t $(DOCKER_REPO):$(VERSION) .

.PHONY: push
push: build
	@docker push $(DOCKER_REPO):$(VERSION)