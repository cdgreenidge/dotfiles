# Be colorful!
export CLICOLOR=1

# Aliases
alias ca="conda activate --stack"
alias g="git"
alias ls="ls -G"
alias py="python"
alias v="vim"
alias vim="nvim"

# Set editor
bindkey -M viins 'jk' vi-cmd-mode
bindkey -v
export EDITOR="nvim"

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

### Added by Zinit's installer
source "$HOME/.yadm_submodules/zinit/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

# Load PURE shell prompt plugin
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure
zinit light Tarrasch/zsh-autoenv  # Must be loaded after pure
