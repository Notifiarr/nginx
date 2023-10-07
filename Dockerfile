# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:419b2e21873c8fd3144f9c8afa4787155744dad89ab7ade54b4f66b06ff36dfa

# Install custom packages.
RUN apk add --update nodejs npm \
    && npm install -g terser \
    && apk add gzip \
    && addgroup -g 281 docker \
    && usermod -aG docker abc

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
