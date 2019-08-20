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

    # Activate Pyenv
    export PYENV_ROOT=$HOME/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    # Activate neovim (not available in conda)
    export PATH=$HOME/local/squashfs-root/usr/bin:$PATH

    # Activate devtools
    alias git="PYENV_VERSION=devtools git"
    alias rg="PYENV_VERSION=devtools rg"
    alias tmux="PYENV_VERSION=devtools tmux"

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
