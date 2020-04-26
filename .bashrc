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
alias dotgit="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias lg="lazygit"
alias g="git"
alias htop="htop"
alias py="python"
alias v="vim"
alias vim="nvim"

# Set editor
export EDITOR="vim"
set -o vi
bind '"jk":vi-movement-mode'

# Enable fasd
eval "$(fasd --init auto)"
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

# Enable fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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

