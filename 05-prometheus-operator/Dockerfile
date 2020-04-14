ARG GO_BUILDER_VERSION

FROM quay.io/ouzi/go-builder:${GO_BUILDER_VERSION} as builder
ARG VERSION

ENV GOPATH=/go
ENV OS=linux
ENV ARCH=arm
ENV GOARM=7

WORKDIR $GOPATH/src/github.com/coreos

RUN git clone --branch ${VERSION} https://github.com/coreos/prometheus-operator

WORKDIR $GOPATH/src/github.com/coreos/prometheus-operator

RUN sed -i 's+./scripts/check_license.sh++g' Makefile \
    && make /go/bin/controller-gen \
    && ls -lah ${GOPATH}/bin \
    && make build

FROM arm32v7/alpine:3.11.5

LABEL summary="prometheus operator image for ARM" \
      description="prometheus operator image for ARM devices" \
      name="givanov/prometheus-operator-armhf" \
      url="https://github.com/givanov/k8s-arm-images" \
      maintainer="Georgi Ivanov <mail@georgi.space>"

ARG VERSION

COPY --from=builder /go/src/github.com/coreos/prometheus-operator/operator /usr/bin/operator
COPY --from=builder /go/src/github.com/coreos/prometheus-operator/prometheus-config-reloader /usr/bin/prometheus-config-reloader

USER nobody:nobody

ENTRYPOINT ["/usr/bin/operator"]