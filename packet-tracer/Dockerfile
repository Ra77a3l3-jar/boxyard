# -----------------------------
# Base image
FROM ubuntu:24.04
ARG DEBIAN_FRONTEND=noninteractive

# -----------------------------
# Set working directory
WORKDIR /home/dev
ENV TZ=Europe/Rome
# -----------------------------
# Install essential packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo curl wget locales x11-apps ca-certificates \
    build-essential pkg-config libssl-dev \
    dialog xdg-utils gtk-update-icon-cache \
    # Core Packet Tracer System Libs
    fuse libfuse2t64 libnss3 libxss1 libxslt1.1 libxcb-xinerama0 \
    libasound2t64 libpulse0 \
    libgl1 libopengl0 libglib2.0-bin \
    libxtst6 libxrender1 libxi6 \
    qtbase5-dev libqt5multimedia5 libqt5xml5 libqt5script5 libqt5scripttools5 libqt5sql5 \
    libxkbcommon-x11-0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-randr0 \
    libxcb-render-util0 libxcb-xfixes0 libxcb-shape0 libxcb-cursor0 \
    && locale-gen en_US.UTF-8 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# -----------------------------
# Create user and group (Running as root)
RUN groupadd -f wireshark \
    && useradd -m -s /bin/bash dev \
    && echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && usermod -aG wireshark dev \
    && chown -R dev:dev /home/dev

# -----------------------------
# Install Packet Tracer (Running as root)
COPY CiscoPacketTracer_900_Ubuntu_64bit.deb /tmp/

# Accept EULA and Install
RUN echo "packettracer packettracer/accept-eula boolean true" | debconf-set-selections \
    && apt-get update \
    && apt-get install -y /tmp/CiscoPacketTracer_900_Ubuntu_64bit.deb \
    && rm /tmp/CiscoPacketTracer_900_Ubuntu_64bit.deb

# -----------------------------
# Switch to dev user ONLY at the end
USER dev
WORKDIR /home/dev
