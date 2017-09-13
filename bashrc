#!/bin/bash
export CLICOLOR="YES"
export P4CONFIG=.p4rc
export P4IGNORE=.gitignore
export P4EDITOR=vi
alias ls='ls -F'
alias vi='vim'

source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
