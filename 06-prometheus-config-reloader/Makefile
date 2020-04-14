DOCKER_REPO := quay.io/givanov/prometheus-config-reloader-armhf
VERSION := v0.38.0

.PHONY: build
build:
	@docker build \
	  --build-arg VERSION=$(VERSION) \
	  -t $(DOCKER_REPO):$(VERSION) .

.PHONY: push
push: build
	@docker push $(DOCKER_REPO):$(VERSION)