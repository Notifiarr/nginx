# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:41c608abc6d7afa464a92c6305c468711a7ed5091252463447b003466886cf1c

ARG INSTALL_PACKAGES=gzip
# Install custom packages.
RUN apk add --update nodejs npm ${INSTALL_PACKAGES} \
    && npm install -g terser \
    && addgroup -g 281 unraiddocker \
    && usermod -aG unraiddocker abc

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
