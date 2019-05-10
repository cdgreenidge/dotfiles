scotty() {
    umask 002
}

# Aliases
alias emacs="emacsclient -create-frame --alternate-editor="
alias e="emacs"
alias dotgit="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias g="git"
alias py="python"
alias v="vim"
alias vim="echo STOP TYPING THIS!"

# Enable 24 bit color
export TERM=xterm-24bit

if [ $HOSTNAME == "scotty.pni.Princeton.EDU" ]; then
    scotty
fi
