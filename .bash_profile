shopt -s nocasematch  # Match pni.Princeton.edu, pni.princeton.edu, etc...

cucumber() {
    :
}

della() {
    module load anaconda3
    conda activate --stack default

    # Activate neovim (not available in conda)
    export PATH=$HOME/local/squashfs-root/usr/bin:$PATH

    # More colors
    alias ls="ls --color"

    # Set default permissions
    umask 002
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
    module load cudatoolkit/10.1

    # Activate neovim (not available in conda)
    export PATH=$HOME/local/squashfs-root/usr/bin:$PATH

    # More colors
    alias ls="ls --color"

    # Set default permissions
    umask 002
}

tiger() {
    # Load conda
    module load anaconda3
    conda activate --stack default

    # Activate neovim (not available in conda)
    export PATH=$HOME/local/squashfs-root/usr/bin:$PATH

    # More colors
    alias ls="ls --color"

    # Set default permissions
    umask 002
}

if [ $HOSTNAME == "cucumber" ]; then
    cucumber
fi
if [[ $HOSTNAME == *"pni.princeton.edu"* ]]; then
    scotty
fi
if [[ $HOSTNAME == *"redshirt"* ]]; then
    scotty
fi
if [[ $HOSTNAME == *"tiger"* ]]; then
    tiger
fi
if [ $HOSTNAME == "pillow-fcp2014" ]; then
    pillow
fi
if [[ $HOSTNAME == *"della"* ]]; then
    della
fi

# Customization for all machines
# It is VERY IMPORTANT that this comes before the bashrc and the conda initialize
# otherwise miniconda will clobber the devtools in base when changing environments
export PATH=~/.yadm_submodules/fasd:$PATH
export PATH=~/bin:$PATH
export OMP_NUM_THREADS=4  # Don't eat up all cores with linear algebra

# Source personal bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
if [ -e /Users/cdg4/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/cdg4/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
