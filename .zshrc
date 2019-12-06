# Be colorful!
export CLICOLOR=1

# Aliases
alias dotgit="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias g="git"
alias htop="htop"
alias py="python"
alias v="vim"
alias vim="nvim"

# Set editor
export EDITOR="nvim"
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

# Enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

# Load PURE shell prompt plugin
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

# Compose a shell command in vim using <ESC> v
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
