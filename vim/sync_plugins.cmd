@echo off
setlocal 
pushd %~dp0

set VIM_DIR=%CD%
set STAGE_DIR=C:\ProgramData\vim-stage
mkdir "%STAGE_DIR%" >nul 2>&1
pushd "%STAGE_DIR%"

if not exist "scripts-a" git clone https://github.com/vim-scripts/a.vim.git scripts-a
if not exist "airline" git clone https://github.com/vim-airline/vim-airline.git airline
if not exist "airline-themes" git clone https://github.com/vim-airline/vim-airline-themes.git airline-themes
if not exist "clang-format" git clone https://github.com/rhysd/vim-clang-format.git clang-format
if not exist "colorschemes" git clone https://github.com/flazz/vim-colorschemes.git colorschemes
if not exist "abolish" git clone https://github.com/tpope/vim-abolish.git abolish
if not exist "espresso" git clone https://github.com/gmoe/vim-espresso.git espresso

robocopy "scripts-a\plugin" "%VIM_DIR%\plugin" /S
robocopy "airline\autoload" "%VIM_DIR%\autoload" /S
robocopy "airline\doc" "%VIM_DIR%\doc" /S
robocopy "airline\plugin" "%VIM_DIR%\plugin" /S
robocopy "airline-themes\autoload" "%VIM_DIR%\autoload" /S
robocopy "airline-themes\doc" "%VIM_DIR%\doc" /S
robocopy "airline-themes\plugin" "%VIM_DIR%\plugin" /S
robocopy "clang-format\autoload" "%VIM_DIR%\autoload" /S
robocopy "clang-format\doc" "%VIM_DIR%\doc" /S
robocopy "clang-format\plugin" "%VIM_DIR%\plugin" /S
robocopy "colorschemes\colors" "%VIM_DIR%\colors" /S
robocopy "abolish\plugin" "%VIM_DIR%\plugin" /S
robocopy "abolish\doc" "%VIM_DIR%\doc" /S
robocopy "espresso\plugin" "%VIM_DIR%\plugin" /S
robocopy "espresso\colors" "%VIM_DIR%\colors" /S

pause

popd
popd
endlocal
