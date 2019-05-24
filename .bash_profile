scotty() {
    # Add CUDA to path
    export PATH=/usr/local/cuda/bin:$PATH
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

    # Add Rust to Ppath
    export PATH=$HOME/.cargo/bin:$PATH

    # Add custom tools to path
    export PATH=/scratch/cdg4/miniconda3/envs/devtools/bin/:$PATH

    # Python virtualenv directory
    export WORKON_HOME=/scratch/cdg4/miniconda3/envs

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/scratch/cdg4/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
	eval "$__conda_setup"
    else
	if [ -f "/scratch/cdg4/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/scratch/cdg4/miniconda3/etc/profile.d/conda.sh"
	else
            export PATH="/scratch/cdg4/miniconda3/bin:$PATH"
	fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

    # Source system bashrc
    if [ -f /etc/bashrc ]; then
	    . /etc/bashrc
    fi
}

cucumber() {
    # Add Rust to path
    export PATH=$HOME/.cargo/bin:$PATH

    # Add Julia to path
    export PATH=/Applications/JuliaPro-1.1.0.1.app/Contents/Resources/julia/Contents/Resources/julia/bin:$PATH

    # Add custom tools to path
    export PATH=/Users/cdg4/miniconda3/envs/devtools/bin/:$PATH

    # Python virtual env directory
    export WORKON_HOME=$HOME/miniconda3/envs/

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/Users/cdg4/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
	eval "$__conda_setup"
    else
	if [ -f "/Users/cdg4/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/Users/cdg4/miniconda3/etc/profile.d/conda.sh"
	else
            export PATH="/Users/cdg4/miniconda3/bin:$PATH"
	fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
}

pillow() {
    # Add custom tools to path
    export PATH=/Users/cdg4/miniconda3/envs/devtools/bin/:$PATH

    # Add Rust to path
    export PATH=$HOME/.cargo/bin:$PATH

    # Python virtual env directory
    export WORKON_HOME=$HOME/miniconda3/envs/

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/Users/cdg4/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
	eval "$__conda_setup"
    else
	if [ -f "/Users/cdg4/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/Users/cdg4/miniconda3/etc/profile.d/conda.sh"
	else
            export PATH="/Users/cdg4/miniconda3/bin:$PATH"
	fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
}

export PATH=~/bin:$PATH

if [ $HOSTNAME == "cucumber" ]; then
    cucumber
fi
if [ $HOSTNAME == "scotty.pni.Princeton.EDU" ]; then
    scotty
fi
if [ $HOSTNAME == "pillow-fcp2014" ]; then
    pillow
fi

# Start emacs daemon
if ! emacsclient -e 0 >&/dev/null; then
   # We run in subshell to supress job ID
   (emacs --daemon > /dev/null 2>&1 &)
fi

# Source git prompt
source ~/bin/git-prompt.sh

# Source personal bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PATH="$HOME/.cargo/bin:$PATH"
