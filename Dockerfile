FROM ghcr.io/linuxserver/baseimage-kasmvnc:debianbullseye

LABEL maintainer="github@sytone.com" \
      org.opencontainers.image.authors="github@sytone.com" \
      org.opencontainers.image.source="https://github.com/sytone/obsidian-remote" \
      org.opencontainers.image.title="Container hosted Obsidian MD" \
      org.opencontainers.image.description="Hosted Obsidian instance allowing access via web browser"

# Set version label
ARG OBSIDIAN_VERSION=1.7.4

# Update and install extra packages
RUN echo "**** install packages ****" && \
    apt-get update && \
    apt-get install -y --no-install-recommends curl libgtk-3-0 libnotify4 libatspi2.0-0 libsecret-1-0 libnss3 desktop-file-utils fonts-noto-color-emoji git ssh-askpass && \
    apt-get autoclean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# Download and install Obsidian
RUN echo "**** download obsidian ****" && \
    curl --location --output obsidian.deb "https://github.com/obsidianmd/obsidian-releases/releases/download/v${OBSIDIAN_VERSION}/obsidian_${OBSIDIAN_VERSION}_amd64.deb" && \
    dpkg -i obsidian.deb && \
    rm obsidian.deb

# Download and install Electron for Smart Connect
RUN echo "**** install electron ****" && \
    apt-get update && \
    apt-get install -y --no-install-recommends nodejs npm && \
    npm install -g electron@13.1.7 && \
    apt-get autoclean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# Install Smart Connect Electron app from Debian package
COPY smart-connect/smart-connect.deb /tmp/smart-connect.deb
RUN dpkg -i /tmp/smart-connect.deb && rm /tmp/smart-connect.deb

# Create necessary folder structure for Smart Connect plugin
RUN mkdir -p /smart-connect

# Environment variables
ENV CUSTOM_PORT="8080" \
    CUSTOM_HTTPS_PORT="8443" \
    CUSTOM_USER="" \
    PASSWORD="" \
    SUBFOLDER="" \
    TITLE="Obsidian v${OBSIDIAN_VERSION}" \
    FM_HOME="/vaults" \
    VAULTS_PATH="/vaults" \
    CONFIG_PATH="/config"

# Add local files
COPY root/ /
COPY smart-connect/ /smart-connect/

# Expose ports and volumes
EXPOSE ${CUSTOM_PORT} ${CUSTOM_HTTPS_PORT}
VOLUME ["${VAULTS_PATH}","${CONFIG_PATH}"]

# Define a healthcheck
HEALTHCHECK CMD /bin/sh -c 'if [ -z "$CUSTOM_USER" ] || [ -z "$PASSWORD" ]; then curl --fail http://localhost:8080/ || exit 1; else curl --fail --user "$CUSTOM_USER:$PASSWORD" http://localhost:8080/ || exit 1; fi'
