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
alias e="emacs"
# alias emacs="emacsclient -create-frame --alternate-editor= -nw"
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
scotty() {
    umask 002
    alias ls="ls --color"
}
if [ $HOSTNAME = "scotty.pni.Princeton.EDU" ]; then
    scotty
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Fasd setup
eval "$(fasd --init auto)"
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
