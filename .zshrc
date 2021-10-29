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

# Activate completion
# On slow systems, checking the cached .zcompdump file to see if it must be 
# regenerated adds a noticable delay to zsh startup.  This little hack restricts 
# it to once a day.  It should be pasted into your own completion file.
#
# The globbing is a little complicated here:
# - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[
#   ]] construct. 
# - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than 
#   throw a globbing error) 
# - '.' matches "regular files" 
# - 'mh+24' matches files (or directories or whatever) that are older than 24 hours.
autoload -Uz compinit 
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

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

# Trigger compilation. This should come at the end so ZSh_MODULES_LOADED is correct
source $ZIT_PATH/extras/compile-zsh-files.zsh

# Uncomment for profiling
# zprof
