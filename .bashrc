# Be colorful!
export TERM=xterm-24bit
export CLICOLOR=1

# Prompt
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_STATESEPARATOR=""
PROMPT_COMMAND='if [ "$CONDA_DEFAULT_ENV" = "base" ]; then CONDA_PROMPT="";
else CONDA_PROMPT="[\e[32m$(basename $CONDA_DEFAULT_ENV)\e[0m]";
fi;
__git_ps1 "
\e[33m\h\e[0m: \w" " $CONDA_PROMPT
\\\$ "'

# Aliases
alias dotgit="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias e="emacs"
alias emacs="emacsclient -create-frame --alternate-editor= -nw"
alias g="git"
alias htop="TERM=xterm-256color htop"
alias py="python"
alias v="vim"
alias vim="echo STOP TYPING THIS!"

# Host-specific settings
scotty() {
    umask 002
    alias ls="ls --color"
}
if [ $HOSTNAME == "scotty.pni.Princeton.EDU" ]; then
    scotty
fi
