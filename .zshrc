# Uncomment for profiling
# zmodload zsh/zprof

# Set editor. This has to come before everything else so it doesn't clobber keybinds
# later (e.g., from fzf)
bindkey -M viins 'jk' vi-cmd-mode
bindkey -v

# System-specific setup
function della {
    module load anaconda3
    module load julia
    conda activate --stack hpc

    # Activate neovim (not available in conda)
    export PATH=$HOME/local/squashfs-root/usr/bin:$PATH

    # More colors
    alias ls="ls --color"

    # Set default permissions
    umask 002

    # Activate fzf
    FZF_SHELL_PATH="$HOME/.conda/envs/hpc/share/fzf/shell"
    if [ -n "$FZF_SHELL_PATH/key-bindings.zsh" ]; then
        source $FZF_SHELL_PATH/key-bindings.zsh
        source $FZF_SHELL_PATH/completion.zsh
    fi
}

function laptop {
    setopt no_global_rcs  # Make sure nothing spooky happens from Nix global configs
    # Activate a Nix installation if one exists
    if [ -e /Users/cdg4/.nix-profile/etc/profile.d/nix.sh ]; then 
        . /Users/cdg4/.nix-profile/etc/profile.d/nix.sh;
    fi

    # Activate fzf
    if [ -n "${commands[fzf-share]}" ]; then
      source "$(fzf-share)/key-bindings.zsh"
      source "$(fzf-share)/completion.zsh"
    fi
}

HOST=$(hostname)
if [[ "$HOST" =~ ".*della.*" ]]; then della; fi
if [[ "$HOST" =~ ".*cucumber.*" ]]; then laptop; fi
unset CONDA_SHLVL  # fix for https://github.com/conda/conda/issues/9392

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
export EDITOR="nvim"

# Bootstrap and initialize the zit plugin manager
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

# Activate zoxide
eval "$(zoxide init zsh)"

alias ca="conda activate --stack"
alias g="git"
alias ls="ls -G"
alias py="python3"
alias v="vim"
alias vim="nvim"

# Trigger compilation. This should come at the end so ZSH_MODULES_LOADED is correct
source $ZIT_PATH/extras/compile-zsh-files.zsh

# Uncomment for profiling
# zprof
