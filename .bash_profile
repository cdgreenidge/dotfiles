della() {
    module load anaconda3
    conda activate --stack hpc
    module load julia

    # Activate neovim (not available in conda)
    export PATH=$HOME/local/squashfs-root/usr/bin:$PATH

    # More colors
    alias ls="ls --color"

    # Set default permissions
    umask 002
}

if [[ $HOSTNAME == *"della"* ]]; then
    della
fi

# Customization for all machines
export PATH=~/bin:$PATH
export OMP_NUM_THREADS=4  # Don't eat up all cores with linear algebra

# Source personal bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
