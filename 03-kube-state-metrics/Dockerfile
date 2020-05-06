ARG GO_BUILDER_VERSION

FROM quay.io/ouzi/go-builder:${GO_BUILDER_VERSION} as builder

ARG VERSION

ENV GOPATH=/go
ENV GOOS=linux
ENV GOARCH=arm
ENV GOARM=7

WORKDIR $GOPATH/src/github.com/kubernetes
RUN git clone --branch ${VERSION} https://github.com/kubernetes/kube-state-metrics \
    && cd kube-state-metrics \
    && make build-local

FROM arm32v7/alpine:3.11.5

LABEL summary="kube-state-metrics image for ARM" \
      description="kube-state-metrics image for ARM devices" \
      name="givanov/kube-state-metrics-armhf" \
      url="https://github.com/givanov/k8s-arm-images" \
      maintainer="Georgi Ivanov <mail@georgi.space>"

ARG VERSION

COPY --from=builder /go/src/github.com/kubernetes/kube-state-metrics/kube-state-metrics /usr/bin/kube-state-metrics

USER nobody:nobody

ENTRYPOINT ["/usr/bin/kube-state-metrics", "--port=8080", "--telemetry-port=8081"]

EXPOSE 8080 8081