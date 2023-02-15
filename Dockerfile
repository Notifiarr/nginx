# Start with swag (for now).
FROM ghcr.io/linuxserver/swag:latest@sha256:b2d23fc58d32abc1a8420950848ed4bfec0c694cb75c3e861f7d7758456acdef

# Install custom packages.
ARG PACKAGES=nodejs npm
RUN apk add --update ${PACKAGES}

LABEL org.opencontainers.image.source = "https://github.com/Notifiarr/nginx"
