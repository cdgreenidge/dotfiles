# Uncomment for profiling
# zmodload zsh/zprof

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

# Set editor
bindkey -M viins 'jk' vi-cmd-mode
bindkey -v
export EDITOR="nvim"

# Bootstrap and initialize the znap plugin manager
export ZIT_MODULES_PATH="~/.yadm_submodules"
ZIT_PATH=~/.yadm_submodules/zit
[[ -f $ZIT_PATH/zit.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/thiagokokada/zit.git $ZIT_PATH
source $ZIT_PATH/zit.zsh

# Load plugins
zit-install "https://github.com/sindresorhus/pure#main" "pure"
fpath+=$ZIT_MODULES_PATH/pure

zit-install "https://github.com/zsh-users/zsh-autosuggestions" "zsh-autosuggestions"
zit-load "zsh-autosuggestions" "zsh-autosuggestions.zsh"

zit-install "https://github.com/zsh-users/zsh-syntax-highlighting" \
"zsh-syntax-highlighting"
zit-load "zsh-syntax-highlighting" "zsh-syntax-highlighting.zsh"

# Activate theme
autoload -U promptinit; promptinit
prompt pure

# Activate fzf
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

# Activate zoxide
eval "$(zoxide init zsh)"

alias ca="conda activate --stack"
alias g="git"
alias ls="ls -G"
alias py="python3"
alias v="vim"
alias vim="nvim"

# Uncomment for profiling
# zprof
