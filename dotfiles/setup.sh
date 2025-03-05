#!/bin/bash

# Source: https://github.com/mischavandenburg/dotfiles-devpod/blob/main/setup

export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"

# Create symlinks for configurations
ln -sF "opt/nvim" "$XDG_CONFIG_HOME"/nvim
ln -sF "$PWD/tmux.conf" "$HOME"/tmux.conf
ln -sF "$PWD/.vimrc" "$HOME"/.vimrc
ln -sF "$PWD/.zshrc" "$HOME"/.zshrc

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

# TODO Install oh-my-zsh
# TODO setup completions, if not already done by by .zshrc file

echo "Setup complete."
