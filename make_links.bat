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
if exist %APPDATA%\mintty goto HAVE_MINTTY
mkdir %APPDATA%\mintty
:HAVE_MINTTY
if exist %APPDATA%\mintty\config goto SKIP_MINTTY_CONFIG
copy /y %USERPROFILE%\.dotfiles\config\mintty\config %APPDATA%\mintty\config
goto HAVE_MINTTY_CONFIG
:SKIP_MINTTY_CONFIG
echo %APPDATA%\mintty\config already exists.  Skipped.
:HAVE_MINTTY_CONFIG

if exist %USERPROFILE%\.config goto HAVE_CONFIG
mkdir %USERPROFILE%\.config\
:HAVE_CONFIG

if exist %USERPROFILE%\.config\git goto SKIP_CONFIG_GIT
junction %USERPROFILE%\.config\git %USERPROFILE%\.dotfiles\config\git
goto HAVE_CONFIG_GIT
:SKIP_CONFIG_GIT
echo %USERPROFILE%\.config\git already exists.  Skipped.
:HAVE_CONFIG_GIT



