# Be colorful!
export CLICOLOR=1

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
alias dotgit="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias g="git"
alias htop="htop"
alias py="python"
alias v="vim"
alias vim="nvim"

# Set editor
export EDITOR="vim"
set -o vi
bind '"jk":vi-movement-mode'

# Host-specific settings
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Random stuff
export OMP_NUM_THREADS=4
# export CUDA_VISIBLE_DEVICES=4
