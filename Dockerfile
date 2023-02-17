# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:bf1c6e8468242a777885eb8d9843a08792aded2f2eeb38742df520411d13527e

# Install custom packages.
RUN apk add --update nodejs npm \
    && npm install -g terser

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
