# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:a18afc426bfc635bbfc6ad5b0fa5814ac7c47a9a3ea5b3f4b839b4e8fda3e5b4

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
