della() {
    module load anaconda3
    conda activate --stack hpc2
    module load julia

    # Activate neovim (not available in conda)
    export PATH=$HOME/local/squashfs-root/usr/bin:$PATH

    # More colors
    alias ls="ls --color"

    # Set default permissions
    umask 002
}

crunch() {
    module load anacondapy/2021.11
    module load matlab/R2021b
    
    CONDA_ENVS_PATH=/scratch/cdg4/conda_envs
    conda activate --stack hpc2
    module load julia
    module load cudatoolkit/11.2

    # Activate neovim (not available in conda)
    export PATH=$HOME/local/squashfs-root/usr/bin:$PATH

    # More colors
    alias ls="ls --color"

    # Set default permissions
    umask 002
}

if [[ $HOSTNAME == *"della"* ]]; then
    della
elif [[ $HOSTNAME == *"pillow-gpu01"* ]]; then
    crunch
fi

# Customization for all machines
export PATH=~/bin:$PATH
export OMP_NUM_THREADS=4  # Don't eat up all cores with linear algebra

# Source personal bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
