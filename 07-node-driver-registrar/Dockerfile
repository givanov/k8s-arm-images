ARG GO_BUILDER_VERSION

FROM quay.io/ouzi/go-builder:${GO_BUILDER_VERSION} as builder

ARG VERSION

ENV GOPATH=/go
ENV GOOS=linux
ENV GOARCH=arm
ENV GOARM=7

WORKDIR $GOPATH/src/github.com/kubernetes-csi

RUN git clone --branch ${VERSION} https://github.com/kubernetes-csi/node-driver-registrar.git \
    && cd node-driver-registrar \
    && make build

FROM arm32v7/alpine:3.11.5

LABEL summary="Kubernetes CSI node driver registrar for ARM" \
      description="Kubernetes node driver registrar for ARM devices" \
      name="givanov/node-driver-registrar-armhf" \
      url="https://github.com/givanov/k8s-arm-images" \
      maintainer="Georgi Ivanov <mail@georgi.space>"

ARG VERSION

COPY --from=builder /go/src/github.com/kubernetes-csi/node-driver-registrar/bin/csi-node-driver-registrar /usr/bin/csi-node-driver-registrar

#USER nobody:nobody

ENTRYPOINT ["/usr/bin/csi-node-driver-registrar"]