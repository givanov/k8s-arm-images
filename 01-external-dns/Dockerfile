FROM quay.io/ouzi/go-builder:1.14.0 as builder

ARG VERSION

ENV GOPATH=/go
ENV GOOS=linux
ENV GOARCH=arm
ENV GOARM=7

WORKDIR $GOPATH/src/github.com/kubernetes-sigs
# RUN git clone --branch v${EXTERNAL_DNS_VERSION} https://github.com/kubernetes-incubator/external-dns \
RUN git clone --branch ${VERSION} https://github.com/kubernetes-sigs/external-dns \
    && cd external-dns \
    && make build

FROM arm32v7/alpine:3.11.5

LABEL summary="Kubernetes External DNS for ARM" \
      description="Kubernetes External DNS for ARM devices" \
      name="givanov/external-dns-armhf" \
      url="https://github.com/givanov/k8s-arm-images" \
      maintainer="Georgi Ivanov <mail@georgi.space>"

ARG VERSION

COPY --from=builder /go/src/github.com/kubernetes-sigs/external-dns/build/external-dns /usr/bin/external-dns

USER nobody:nobody

ENTRYPOINT ["/usr/bin/external-dns"]