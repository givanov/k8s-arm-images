ARG GO_BUILDER_VERSION

FROM quay.io/ouzi/go-builder:${GO_BUILDER_VERSION} as builder

ARG VERSION

ENV GOPATH=/go
ENV GOOS=linux
ENV GOARCH=arm
ENV GOARM=7

WORKDIR $GOPATH/src/github.com/kubernetes-csi

RUN git clone --branch ${VERSION} https://github.com/kubernetes-csi/csi-driver-smb.git \
    && cd csi-driver-smb \
    && make smb

FROM arm32v7/alpine:3.11.5

LABEL summary="Kubernetes CSI driver for ARM" \
      description="Kubernetes driver for ARM devices" \
      name="givanov/smb-csi-armhf" \
      url="https://github.com/givanov/k8s-arm-images" \
      maintainer="Georgi Ivanov <mail@georgi.space>"

ARG VERSION

COPY --from=builder /go/src/github.com/kubernetes-csi/csi-driver-smb/_output/smbplugin /usr/bin/csi-driver-smb

#USER nobody:nobody

ENTRYPOINT ["/usr/bin/csi-driver-smb"]