#!/bin/bash

ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/bash_profile ~/.bash_profile
ln -s ~/.dotfiles/iterm2 ~/.iterm2
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/gitexcludes ~/.gitexcludes
ln -s ~/.dotfiles/vscode_user_settings.json ~/Library/Application\ Support/Code/User/settings.json

if [ ! -d ~/.vim ]; then
    ln -s ~/.dotfiles/vim ~/.vim
fi

mkdir -p ~/.config
ln -s ~/.dotfiles/config/nvim ~/.config

mkdir -p ~/.local/share
ln -s ~/.dotfiles/local/share/nvim ~/.local/share

mkdir -p ~/.local/lib
case $OSTYPE in
    darwin*)
        ln -s /usr/local/Cellar/llvm/HEAD-600899c/lib ~/.local/lib/llvm ;;
esac

