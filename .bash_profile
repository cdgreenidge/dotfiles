cucumber() {
    :
}

pillow() {
    # Update PATH for the Google Cloud SDK.
    if [ -f '/Users/cdg4/google-cloud-sdk/path.bash.inc' ]; then
        . '/Users/cdg4/google-cloud-sdk/path.bash.inc'
    fi

    # Enable shell completion for gcloud
    if [ -f '/Users/cdg4/google-cloud-sdk/completion.bash.inc' ]; then
        . '/Users/cdg4/google-cloud-sdk/completion.bash.inc'
    fi
    
    # Add Rust to path
    export PATH="$HOME/.cargo/bin:$PATH"

    # Add Homebrew to path
    export PATH="/usr/local/bin:$PATH"
}

scotty() {
    # Add CUDA to path
    export PATH=/usr/local/cuda/bin:$PATH
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

    # Activate neovim (not available in conda)
    export PATH=$HOME/local/squashfs-root/usr/bin:$PATH

    # More colors
    alias ls="ls --color"

    # Set default permissions
    umask 002

    # Source system bashrc
    if [ -f /etc/bashrc ]; then
	    . /etc/bashrc
    fi
}

# Customization for all machines
export PATH=$PATH:~/.yadm_submodules/fasd
export PATH=$PATH:~/bin
export PATH=~/miniconda3/bin:$PATH

if [ $HOSTNAME == "cucumber" ]; then
    cucumber
fi
if [ $HOSTNAME == "scotty.pni.Princeton.EDU" ]; then
    scotty
fi
if [ $HOSTNAME == "spock.pni.Princeton.EDU" ]; then
    scotty
fi
if [ $HOSTNAME == "spock-login.pni.Princeton.EDU" ]; then
    scotty
fi
if [ $HOSTNAME == "pillow-gpu01.pni.princeton.edu" ]; then
    scotty
fi
if [ $HOSTNAME == "pillow-fcp2014" ]; then
    pillow
fi

# Source personal bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/jukebox/scratch/cdg4/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/jukebox/scratch/cdg4/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/jukebox/scratch/cdg4/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/jukebox/scratch/cdg4/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
