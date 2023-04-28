# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/swag:latest@sha256:d5b4abe6452d8caeaf26946d4f4833d8cadf7d8cdd0926a8dd98bfbb5146c507

# Install custom packages.
RUN apk add --update nodejs npm \
    && npm install -g terser

LABEL org.opencontainers.image.source = "https://github.com/TwitchCaptain/swag-docker"
