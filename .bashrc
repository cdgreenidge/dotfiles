scotty() {
    umask 002
}

alias dotgit="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

if [ $HOSTNAME == "scotty.pni.Princeton.EDU" ]; then
    scotty
fi
