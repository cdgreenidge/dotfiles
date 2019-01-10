# Colors
autoload colors && colors
export CLICOLOR=1

# Prompt
source ~/bin/git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_STATESEPARATOR=""
precmd () { __git_ps1 "
%{$fg[yellow]%}%m%{$reset_color%}: %~" "
$ " " (%s)"}

# Enable completion
fpath=(~/bin/completions $fpath)
autoload -Uz compinit && compinit

# Keep track of history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Use vim keybindings
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

# Use vim for our editor
export EDITOR=vim

# Disable line editor if we're inside emacs
if [[ -n ${EMACS} ]]; then
    unsetopt zle
fi

# Enable fasd
eval "$(fasd --init auto)"

# Make directory navigation more pleasant
setopt autopushd
alias dirs="dirs -v"

# Aliases
alias dotgit="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias g="git"
alias py="python"
alias scotty="ssh scotty -t /mnt/sink/scratch/cdg4/linuxbrew/bin/zsh"
alias v="vim"

# Fasd aliases
alias a="fasd -a"        # any
alias s="fasd -si"       # show / search / select
alias d="fasd -d"        # directory
alias f="fasd -f"        # file
alias sd="fasd -sid"     # interactive directory selection
alias sf="fasd -sif"     # interactive file selection
alias z="fasd_cd -d"     # cd, same functionality as j in autojump
alias zz="fasd_cd -d -i" # cd with interactive selection

# Configure the FZF fuzzy finder
export FZF_DEFAULT_OPTS=' --color light'
export FZF_DEFAULT_COMMAND='rg --files -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
