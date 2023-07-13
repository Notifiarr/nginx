# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:b9282a9a7203428d6943e75fdb7e15309272ff10c6f5e18a561994e2f16bb967

# Install custom packages.
RUN apk add --update nodejs npm \
    && npm install -g terser

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
