# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:04e539be82748aabf09e9b90f9fe3046809366249f27016e4a8161582ecd73c1

# Install custom packages.
RUN apk add --update nodejs npm \
    && npm install -g terser

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
