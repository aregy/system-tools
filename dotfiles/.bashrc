#!/usr/bin/env bash
#PS1='\e[32m\u@\[\e[0:36m\]\H:\e[36m\w\e[0;1m\] '

alias ll='ls -Al'
alias vim=nvim
alias emacs='emacs -nw'
export PATH=~/go/bin:/home/ay/.local/bin:$PATH

## a terribly painful u+002d (hyphen-minus) vs u+2010 (true "hyphen") issue is 
## averted vs. en_US.UTF-8, though some linuxes already use c.UTF-8
export LANG=c.UTF-8

## to avoid a common complaint in WSL when running screen that /run/uscreens
## does not exist and cannot be created and does not have 777 permissions
if [! -d "$HOME/.screen" ]; then
	mkdir -p "$HOME/.screen" && cd chmod 777 $_
fi
export SCREENDIR="$HOME/.screen"
