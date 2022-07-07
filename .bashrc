[ -z "$PS1" ] && return  # Skip loading if we're in a non-interactive shell

# General settings
export CLICOLOR=1
shopt -s extglob

# Prompt
source ~/bin/git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_STATESEPARATOR=""

PROMPT_COMMAND='
__git_ps1 "
\e[33m\h\e[0m [$CONDA_DEFAULT_ENV]: \e[34m\]\w\e[m\]" "
\\\$ "'

# Aliases
alias ca="conda activate --stack"
alias e="emacsclient -nw"
alias g="git"
alias ls="ls -G"
alias py="python3"

# Set editor
export EDITOR="emacsclient"
set -o emacs
bind '"jk":vi-movement-mode'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Start emacs daemon
(pgrep emacs > /dev/null || emacs --daemon > /dev/null 2>%1 &)
