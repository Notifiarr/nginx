# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:419b2e21873c8fd3144f9c8afa4787155744dad89ab7ade54b4f66b06ff36dfa

# Install custom packages.
RUN apk add --update nodejs npm docker gzip \
    && npm install -g terser \
    && addgroup -g 281 unraiddocker \
    && usermod -aG unraiddocker abc

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
