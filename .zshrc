# Uncomment for profiling
# zmodload zsh/zprof

HISTSIZE=10000
SAVEHIST=10000

# Set editor
bindkey -M viins 'jk' vi-cmd-mode
bindkey -v
export EDITOR="nvim"

# Bootstrap and initialize the znap plugin manager
ZNAP_PATH=~/.yadm_submodules/zsh-snap
[[ -f $ZNAP_PATH/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git $ZNAP_PATH
source $ZNAP_PATH/znap.zsh

# Load plugins
znap prompt sindresorhus/pure
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

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
