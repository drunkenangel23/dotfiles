@echo off
setlocal EnableExtensions

rem ln -s ~/.dotfiles/bashrc ~/.bashrc
rem ln -s ~/.dotfiles/bash_profile ~/.bash_profile
rem ln -s ~/.dotfiles/iterm2 ~/.iterm2
rem ln -s ~/.dotfiles/gitconfig ~/.gitconfig
rem ln -s ~/.dotfiles/gitexcludes ~/.gitexcludes
rem ln -s ~/.dotfiles/vscode_user_settings.json ~/Library/Application\ Support/Code/User/settings.json

if exist %USERPROFILE$\.vim goto HAVE_DOT_VIM
mklink /J %USERPROFILE%\.vim %USERPROFILE%\.dotfiles\vim
:HAVE_DOT_VIM

if exist %USERPROFILE%\vimfiles goto HAVE_VIMFILES
mklink /J %USERPROFILE%\vimfiles %USERPROFILE%\.dotfiles\vim
:HAVE_VIMFILES

if exist %APPDATA%\Code\User\settings.json goto HAVE_VSCODE_SETTINGS
mklink /J %APPDATA%\Code\User\settings.json %USERPROFILE%\.dotfiles\AppData\Code\User\settings.json
:HAVE_VSCODE_SETTINGS

if exist %APPDATA%\Code\User\settings.json goto HAVE_VSCODE_KEYBINDINGS
mklink /J %APPDATA%\Code\User\keybindings.json %USERPROFILE%\.dotfiles\AppData\Code\User\keybindings.json
:HAVE_VSCODE_KEYBINDINGS

rem mintty is less than stellar and ignores the config file unless it has unix line endings.
rem git is a pain in the ass and insists on fucking with the line endings so just copy the 
rem file.  Afterwards, you will likely have to to a "set ff=unix" in vim to fix it up.
REM if exist %APPDATA%\mintty goto HAVE_MINTTY
REM mkdir %APPDATA%\mintty
REM :HAVE_MINTTY
REM if exist %APPDATA%\mintty\config goto SKIP_MINTTY_CONFIG
REM copy /y %USERPROFILE%\.dotfiles\config\mintty\config %APPDATA%\mintty\config
REM goto HAVE_MINTTY_CONFIG
REM :SKIP_MINTTY_CONFIG
REM echo %APPDATA%\mintty\config already exists.  Skipped.
REM :HAVE_MINTTY_CONFIG

REM if exist %USERPROFILE%\.config goto HAVE_CONFIG
REM mkdir %USERPROFILE%\.config\
REM :HAVE_CONFIG

REM if exist %USERPROFILE%\.config\git goto SKIP_CONFIG_GIT
REM %JUNCTION% %USERPROFILE%\.config\git %USERPROFILE%\.dotfiles\config\git
REM goto HAVE_CONFIG_GIT
REM :SKIP_CONFIG_GIT
REM echo %USERPROFILE%\.config\git already exists.  Skipped.
REM :HAVE_CONFIG_GIT

rem ::Wing IDE
REM robocopy "%~dp0config\Wing IDE 5" "%APPDATA%\Wing IDE 5" /S



