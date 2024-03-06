# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:bf82d3459b62216cc4c8795eebdc0354022fc6ce4625f7c4b862f38c712482e5

ARG INSTALL_PACKAGES=gzip
# Install custom packages.
RUN apk add --update nodejs npm libgcc curl ${INSTALL_PACKAGES} \
    && npm install -g terser \
    && addgroup -g 281 unraiddocker \
    && usermod -aG unraiddocker abc
RUN curl -sLO https://github.com/DataDog/dd-trace-php/releases/latest/download/datadog-setup.php \
    && php datadog-setup.php --php-bin=all --enable-appsec --enable-profiling \
    && rm -f datadog-setup.php

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
