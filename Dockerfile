# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:a57a19633618c064a2d33948298d89928700726fda91b10f637cc3147ab4bb92

# Install custom packages.
RUN apk add --update nodejs npm \
    && npm install -g terser \
    && apk add gzip

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
