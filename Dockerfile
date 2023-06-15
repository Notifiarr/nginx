# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:20bfa834850cce5f97160a1d1e601b08d9e73b9c4e43fe12b076ea3b9afe3d87

# Install custom packages.
RUN apk add --update nodejs npm \
    && npm install -g terser

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
