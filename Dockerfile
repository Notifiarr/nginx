# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:f4ce76d507a7004f95e4f8ea717a67fc84bf87d829f0abcae82abba38a4b8acd

ARG INSTALL_PACKAGES=gzip
# Install custom packages.
RUN apk add --update nodejs npm ${INSTALL_PACKAGES} \
    && npm install -g terser \
    && addgroup -g 281 unraiddocker \
    && usermod -aG unraiddocker abc

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
