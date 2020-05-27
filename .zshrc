# Be colorful!
export CLICOLOR=1

# Aliases
alias ca="conda activate --stack"
alias dotgit="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias lg="lazygit"
alias ls="ls -G"
alias g="git"
alias htop="htop"
alias py="python"
alias v="vim"
alias vim="nvim"

# Set editor
export EDITOR="nvim"
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Added by Zplugin's installer
source "$HOME/.yadm_submodules/zplugin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

# Load PURE shell prompt plugin
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure
zplugin light Tarrasch/zsh-autoenv

# Compose a shell command in vim using <ESC> v
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
