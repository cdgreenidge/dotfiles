export OMP_NUM_THREADS=4
export PATH=$PATH:~/.yadm_submodules/fasd
export PATH=$PATH:~/bin
export PATH=$PATH:~/miniconda3/bin
export WORKON_HOME=~/miniconda3/envs

unset CONDA_SHLVL  # fix for https://github.com/conda/conda/issues/9392
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/cdg4/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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
