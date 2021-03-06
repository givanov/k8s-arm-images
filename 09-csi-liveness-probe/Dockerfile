ARG GO_BUILDER_VERSION

FROM quay.io/ouzi/go-builder:${GO_BUILDER_VERSION} as builder

ARG VERSION

ENV GOPATH=/go
ENV GOOS=linux
ENV GOARCH=arm
ENV GOARM=7

WORKDIR $GOPATH/src/github.com/kubernetes-csi

RUN git clone --branch ${VERSION} https://github.com/kubernetes-csi/livenessprobe.git \
    && cd livenessprobe \
    && make build

FROM arm32v7/alpine:3.11.5

LABEL summary="Kubernetes CSI liveness probe for ARM" \
      description="Kubernetes liveness probe for ARM devices" \
      name="givanov/smb-csi-armhf" \
      url="https://github.com/givanov/k8s-arm-images" \
      maintainer="Georgi Ivanov <mail@georgi.space>"

ARG VERSION

COPY --from=builder /go/src/github.com/kubernetes-csi/livenessprobe/bin/livenessprobe /usr/bin/livenessprobe

#USER nobody:nobody

ENTRYPOINT ["/usr/bin/livenessprobe"]