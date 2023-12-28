# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:6728667f8a591d6551ea0ada900e160825a6ffb3e7b4c9edb224dab5ff622d52

ARG INSTALL_PACKAGES=gzip
# Install custom packages.
RUN apk add --update nodejs npm ${INSTALL_PACKAGES} \
    && npm install -g terser \
    && addgroup -g 281 unraiddocker \
    && usermod -aG unraiddocker abc

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
