# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:922f126a4133dae8cee607e56b53ed8017da442cf677886240c1677fc644dbc4

# Install custom packages.
RUN apk add --update nodejs npm \
    && npm install -g terser \
    && apk add gzip

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
