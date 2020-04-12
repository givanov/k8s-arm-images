DOCKER_REPO := quay.io/givanov/external-dns-armhf
EXTERNAL_DNS_VERSION := v0.7.1

.PHONY: build
build:
	@docker build --build-arg VERSION=${EXTERNAL_DNS_VERSION} -t $(DOCKER_REPO):$(EXTERNAL_DNS_VERSION) .

.PHONY: push
push: build
	@docker push $(DOCKER_REPO):$(EXTERNAL_DNS_VERSION)