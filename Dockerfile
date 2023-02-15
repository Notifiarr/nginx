# LSIO makes a very nice nginx container.
FROM ghcr.io/linuxserver/nginx:latest@sha256:7b97b0a629b63bccacfdfd732b9a13f0afe1aabf453154281538b800830565a5

# Install custom packages.
ARG PACKAGES=nodejs npm
RUN apk add --update ${PACKAGES}

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
