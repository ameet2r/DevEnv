# syntax=docker/dockerfile:1

FROM --platform=linux/amd64 mcr.microsoft.com/devcontainers/python:3.11-bullseye

# Install curl and other needed tools
RUN apt-get update && \
    apt-get install build-essential curl file git ruby-full locales --no-install-recommends -y && \
    rm -rf /var/lib/apt/lists/*

# RUN localedef -i en_US -f UTF-8 en_US.UTF-8

RUN useradd -m -s /bin/bash linuxbrew && \
    echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

# Install Homebrew and oh-my-zsh
USER linuxbrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

USER root
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"

# Download my kickstart-nvim fork
RUN git clone https://github.com/ameet2r/kickstart.nvim.git /opt/nvim

# Download my all my dotfiles and setup script
RUN git clone https://github.com/ameet2r/DevEnv.git /tmp/DevEnv
RUN cp -r /tmp/DevEnv/dotfiles/.??* /tmp/DevEnv/dotfiles/* /home/linuxbrew

USER linuxbrew
WORKDIR /home/linuxbrew

# Copy the source code into the container.
COPY . .

# Execute my setup script
RUN ./setup.sh

# Copy over nvim files to .config/nvim
RUN cp -r /opt/nvim /home/linuxbrew/.config/
