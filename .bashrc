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
export EDITOR="vim"
set -o vi
bind '"jk":vi-movement-mode'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/people/cdg4/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/people/cdg4/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/people/cdg4/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/people/cdg4/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

