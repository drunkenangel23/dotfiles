@echo off

rem ln -s ~/.dotfiles/bashrc ~/.bashrc
rem ln -s ~/.dotfiles/bash_profile ~/.bash_profile
rem ln -s ~/.dotfiles/iterm2 ~/.iterm2
rem ln -s ~/.dotfiles/gitconfig ~/.gitconfig
rem ln -s ~/.dotfiles/gitexcludes ~/.gitexcludes
rem ln -s ~/.dotfiles/vscode_user_settings.json ~/Library/Application\ Support/Code/User/settings.json

if not exist %USERPROFILE%\.vim junction %USERPROFILE%\.vim %USERPROFILE%\.dotfiles\vim
if not exist %USERPROFILE%\vimfiles junction %USERPROFILE%\vimfiles %USERPROFILE%\.dotfiles\vim

rem mintty is less than stellar and ignores the config file unless it has unix line endings.
rem git is a pain in the ass and insists on fucking with the line endings so just copy the 
rem file.  Afterwards, you will likely have to to a "set ff=unix" in vim to fix it up.
mkdir %APPDATA%\mintty
copy /y %USERPROFILE\.dotfiles\config\mintty\config %APPDATA%\mintty\config

mkdir %USERPROFILE%\.config\
junction %USERPROFILE%\.config\git %USERPROFILE%\.dotfiles\config\git




