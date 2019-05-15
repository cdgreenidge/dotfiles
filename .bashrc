scotty() {
    umask 002
    alias ls="ls --color"
}

# Be colorful!
export TERM=xterm-24bit
export CLICOLOR=1

# Aliases
alias dotgit="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias e="emacs"
alias emacs="emacsclient -create-frame --alternate-editor= -nw"
alias g="git"
alias htop="TERM=xterm-256color htop"
alias py="python"
alias v="vim"
alias vim="echo STOP TYPING THIS!"

if [ $HOSTNAME == "scotty.pni.Princeton.EDU" ]; then
    scotty
fi
