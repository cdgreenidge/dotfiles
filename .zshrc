# Bootstrap and initialize the znap plugin manager
ZNAP_PATH=~/.yadm_submodules/zsh-snap
[[ -f $ZNAP_PATH/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git $ZNAP_PATH
source $ZNAP_PATH/znap.zsh

# Load plugins
znap prompt sindresorhus/pure
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

alias ca="conda activate --stack"
alias g="git"
alias ls="ls -G"
alias py="python3"
alias v="vim"
alias vim="nvim"

# Set editor
bindkey -M viins 'jk' vi-cmd-mode
bindkey -v
export EDITOR="nvim"
