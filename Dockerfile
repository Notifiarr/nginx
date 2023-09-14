# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:e7f7b9dc38312e6221159411d8767dfcf366798629b89ba37c97a3783f7959b4

# Install custom packages.
RUN apk add --update nodejs npm \
    && npm install -g terser \
    && apk add gzip

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
