FROM arm32v7/python:3.8.2-alpine3.11 as builder

LABEL summary="k8s-sidecar image for ARM" \
      description="k8s-sidecar image for ARM devices" \
      name="givanov/k8s-sidecar-armhf" \
      url="https://github.com/givanov/k8s-arm-images" \
      maintainer="Georgi Ivanov <mail@georgi.space>"

ARG VERSION

WORKDIR /app

RUN apk add --no-cache gcc git \ 
    && git clone --branch ${VERSION} https://github.com/kiwigrid/k8s-sidecar \
    && cd k8s-sidecar \
    && pip install -r requirements.txt \
    && apk del -r gcc \
    && rm -rf /var/cache/apk/* requirements.txt

#run as non-privileged user 
USER nobody
CMD         [ "python", "-u", "/app/k8s-sidecar/sidecar/sidecar.py" ]