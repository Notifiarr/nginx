# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:2f82e09ff15ebc1c99d6877e23cfe39cb3bd64801301e4ab8d150e1e89bb39c7

# Install custom packages.
RUN apk add --update nodejs npm \
    && npm install -g terser

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
