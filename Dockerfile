# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:03d3fa479c2808b1cd2eabadae38fb2777971d392dbd628c34374e925baca9b4

ARG INSTALL_PACKAGES=gzip
# Install custom packages.
RUN apk add --update nodejs npm ${INSTALL_PACKAGES} \
    && npm install -g terser \
    && addgroup -g 281 unraiddocker \
    && usermod -aG unraiddocker abc

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
