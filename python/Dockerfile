# -----------------------------
# Base image
FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
ARG DOCKER_USER=dev

# -----------------------------
# Set working directory
WORKDIR /home/$DOCKER_USER
ENV TZ=Europe/Rome
# -----------------------------
# Install essential packages
RUN apt update && apt install -y --no-install-recommends \
    sudo curl wget git fish locales x11-apps \
    build-essential pkg-config libssl-dev software-properties-common \
    dialog xdg-utils gtk-update-icon-cache \
    libnss3 libxss1 libxslt1.1 libxcb-xinerama0-dev \
    fzf ripgrep neovim v4l-utils \
    && locale-gen en_US.UTF-8 \
    && apt clean && rm -rf /var/lib/apt/lists/*

# -----------------------------
# Create user and group
RUN useradd -m -s /usr/bin/fish $DOCKER_USER \
    && echo "$DOCKER_USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && chown -R $DOCKER_USER:$DOCKER_USER /home/$DOCKER_USER

WORKDIR /home/$DOCKER_USER

# -----------------------------
# Switch to dev user
USER $DOCKER_USER

# -----------------------------
# Install pixi
RUN mkdir -p ~/.config/fish && curl -fsSL https://pixi.sh/install.sh | bash

# -----------------------------
# Install eza
USER root
RUN wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | gpg --dearmor -o /etc/apt/keyrings/gierens.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | tee /etc/apt/sources.list.d/gierens.list \
    && chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list \
    && apt update \
    && apt install -y eza \
    && apt clean && rm -rf /var/lib/apt/lists/*

# -----------------------------
# Install zoxide as root to /usr/local/bin
RUN curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh -s -- --bin-dir /usr/local/bin

USER $DOCKER_USER

# -----------------------------
# Add pixi and zoxide to PATH
ENV PATH="/home/$DOCKER_USER/.pixi/bin:/usr/local/bin:${PATH}"

# -----------------------------
# Copy setup script
COPY --chown=$DOCKER_USER:$DOCKER_USER setup_fish.sh /home/$DOCKER_USER/setup_fish.sh
RUN chmod +x /home/$DOCKER_USER/setup_fish.sh

# -----------------------------
# Final working directory
USER $DOCKER_USER
WORKDIR /home/$DOCKER_USER

# -----------------------------
# Setup fish config symlink at runtime
CMD ["./setup_fish.sh"]
