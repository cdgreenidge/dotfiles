# Colors
autoload colors && colors
export CLICOLOR=1

# Prompt
source ~/bin/git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_STATESEPARATOR=""

precmd () {
    if [ "$CONDA_DEFAULT_ENV" = "base" ]; then
        CONDA_PROMPT=""
    else
        CONDA_PROMPT=" [%{$fg[green]%}$(basename $CONDA_DEFAULT_ENV)%{$reset_color%}]"
    fi

   __git_ps1 "
%{$fg[yellow]%}%m%{$reset_color%}: %~" "$CONDA_PROMPT $prompt_newline
$ "
}


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
export EDITOR=nvim

# Disable line editor if we're inside emacs
if [[ -n ${EMACS} ]]; then
    unsetopt zle
fi

# Enable fasd
eval "$(fasd --init auto)"

# Make directory navigation more pleasant
setopt autopushd
alias dirs="dirs -v"

# Add home bin directory
export PATH=~/bin:$PATH

# Aliases
alias dotgit="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias g="git"
alias py="python"
alias scottyjupyter="TERM=xterm-256color remotejupyter cdg4@scotty.princeton.edu"
alias ssh="TERM=xterm-256color ssh"
alias v="nvim"
alias vim="echo STOP TYPING THIS!"

# Fasd aliases
alias a="fasd -a"        # any
alias s="fasd -si"       # show / search / select
alias d="fasd -d"        # directory
alias f="fasd -f"        # file
alias sd="fasd -sid"     # interactive directory selection
alias sf="fasd -sif"     # interactive file selection
alias z="fasd_cd -d"     # cd, same functionality as j in autojump
alias zz="fasd_cd -d -i" # cd with interactive selection

# Make pipenv less noisy
export PIPENV_VERBOSITY=-1

# Make pyenv less noisy
export PYENV_VIRTUALENV_DISABLE_PROMPT="true"

# Tell emacs about our Python virtualenv directory
export WORKON_HOME=/miniconda3/envs

# For some reason this un-breaks tab completion in tmux
export COMPLETION_WAITING_DOTS="true"

# Colors for DVC completion script
# Case insensitive match
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

export FZF_DEFAULT_COMMAND='fd --type f'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
