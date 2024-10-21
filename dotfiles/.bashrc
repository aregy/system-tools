# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

test -s ~/.alias && . ~/.alias || true

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ay/car/google-cloud-sdk/path.bash.inc' ]; then . '/home/ay/car/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ay/car/google-cloud-sdk/completion.bash.inc' ]; then . '/home/ay/car/google-cloud-sdk/completion.bash.inc'; fi

PATH=$PATH:$HOME/go/bin
PATH=$PATH:$HOME/.local/bin

## a terribly painful u+002d (hyphen-minus) vs u+2010 (true "hyphen") issue is 
## averted vs. en_US.UTF-8, though some linuxes already use c.UTF-8
export LANG=c.UTF-8

## to avoid a common complaint in WSL when running screen that /run/uscreens
## does not exist and cannot be created and does not have 777 permissions
if [ ! -d "$HOME/.screen" ]; then
	mkdir -p "$HOME/.screen" && chmod 777 "$HOME/.screen"
fi
export SCREENDIR="$HOME/.screen"
