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
)

for package in "${packages[@]}"; do
	echo "Installing $package..."
	/home/linuxbrew/.linuxbrew/bin/brew install "$package"
done

echo "All pacakges have been installed."

source "$HOME"/.zshrc

echo "Setup complete."
