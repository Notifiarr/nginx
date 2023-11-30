# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:b3072074c19477003dd62f89840c14c98c1d1b588e273879e0f47c1bc0050a04

ARG INSTALL_PACKAGES=gzip
# Install custom packages.
RUN apk add --update nodejs npm ${INSTALL_PACKAGES} \
    && npm install -g terser \
    && addgroup -g 281 unraiddocker \
    && usermod -aG unraiddocker abc

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
