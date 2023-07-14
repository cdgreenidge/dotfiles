# Uncomment for profiling
# zmodload zsh/zprof

# Set editor. This has to come before everything else so it doesn't clobber keybinds
# later (e.g., from fzf)
bindkey -e
EDITOR="emacs -nw"

# Activate fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

# Enable znap
[[ -r ~/.config/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.config/znap
source ~/.config/znap/znap.zsh  # Start Znap

znap prompt sindresorhus/pure
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

# Activate zoxide
eval "$(zoxide init zsh)"

alias e=$EDITOR
alias g="git"
alias ls="ls -G"
