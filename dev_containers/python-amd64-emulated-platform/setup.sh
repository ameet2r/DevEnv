#!/bin/bash

# Source: https://github.com/mischavandenburg/dotfiles-devpod/blob/main/setup

export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"

# TODO maybe do something with cht.sh and tmux-sessionizer if needed

packages=(
	ripgrep
	fzf
	zsh-autosuggestions
	neovim
	node
)

for package in "${packages[@]}"; do
	echo "Installing $package..."
	/home/linuxbrew/.linuxbrew/bin/brew install "$package"
done

echo "All packages have been installed."

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

echo 'export LANG=en_US.utf8' >> ~/.zshrc
echo 'export LC_ALL=en_US.utf8' >> ~/.zshrc
echo 'export LC_CTYPE=en_US.utf8' >> ~/.zshrc
source ~/.zshrc

source "$HOME"/.zshrc

echo "Setup complete."
