ARG GO_BUILDER_VERSION

FROM quay.io/ouzi/go-builder:${GO_BUILDER_VERSION} as builder

ARG VERSION

ENV GOPATH=/go
ENV GOOS=linux
ENV GOARCH=arm
ENV GOARM=7

WORKDIR $GOPATH/src/github.com/square
RUN git clone --branch ${VERSION} https://github.com/square/ghostunnel \
    && cd ghostunnel \
    && make ghostunnel

FROM arm32v7/alpine:3.11.5

LABEL summary="ghostunnel image for ARM" \
      description="ghostunnel image for ARM devices" \
      name="givanov/ghostunnel-armhf" \
      url="https://github.com/givanov/k8s-arm-images" \
      maintainer="Georgi Ivanov <mail@georgi.space>"

ARG VERSION

COPY --from=builder /go/src/github.com/square/ghostunnel/ghostunnel /usr/bin/ghostunnel

USER nobody:nobody

ENTRYPOINT ["/usr/bin/ghostunnel"]