cucumber() {
    # Add Rust to path
    export PATH=$HOME/.cargo/bin:$PATH

    # Add Julia to path
    export PATH=/Applications/JuliaPro-1.1.0.1.app/Contents/Resources/julia/Contents/Resources/julia/bin:$PATH
}

pillow() {
    # Add Julia to path
    export PATH=/Applications/JuliaPro-1.1.1.1.app/Contents/Resources/julia/Contents/Resources/julia/bin/:$PATH

    # Add Rust to path
    export PATH=$HOME/.cargo/bin:$PATH

    # Activate Pyenv
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    # Update PATH for the Google Cloud SDK.
    if [ -f '/Users/cdg4/google-cloud-sdk/path.bash.inc' ]; then
        . '/Users/cdg4/google-cloud-sdk/path.bash.inc'
    fi

    # Enable shell completion for gcloud
    if [ -f '/Users/cdg4/google-cloud-sdk/completion.bash.inc' ]; then
        . '/Users/cdg4/google-cloud-sdk/completion.bash.inc'
    fi
}

scotty() {
    # Add CUDA to path
    export PATH=/usr/local/cuda/bin:$PATH
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

    # Add Rust to Ppath
    export PATH=$HOME/.cargo/bin:$PATH

    # Activate neovim (not available in conda)
    export PATH=$HOME/local/squashfs-root/usr/bin:$PATH

    # Add devtools to path
    export PATH=/jukebox/scratch/cdg4/miniconda3/bin:$PATH

    export PATH=$HOME/bin:$PATH

    # More colors
    alias ls="ls --color"

    # Source system bashrc
    if [ -f /etc/bashrc ]; then
	    . /etc/bashrc
    fi
}

export PATH=~/bin:$PATH

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
