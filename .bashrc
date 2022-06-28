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
\e[33m\h\e[0m: \w" "
\\\$ "'

# Aliases
alias ca="conda activate --stack"
alias g="git"
alias ls="ls -G"
alias py="python3"
alias v="vim"
alias vim="nvim"

# Set editor
export EDITOR="emacs"
set -o vi
bind '"jk":vi-movement-mode'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
