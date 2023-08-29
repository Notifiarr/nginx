# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:6116a59bb8d09055f9ae48126ea2a3bb5eb227e79e67627cfe1f0d8c6a39a77f

# Install custom packages.
RUN apk add --update nodejs npm \
    && npm install -g terser \
    && apk add gzip

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
