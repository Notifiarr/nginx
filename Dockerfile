# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:6cf2ff50a5f05bb0ab66cfa0823449572d05989eb7ddb44849d568737be250d5

# Install custom packages.
RUN apk add --update nodejs npm \
    && npm install -g terser \
    && apk add gzip

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
