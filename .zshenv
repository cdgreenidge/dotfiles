export OMP_NUM_THREADS=4
export PATH=$PATH:~/.emacs.d/bin
export PATH=$PATH:~/.yadm_submodules/fasd
export PATH=$PATH:~/bin
export PATH=$PATH:~/miniconda3/bin
export WORKON_HOME=~/miniconda3/envs
unset CONDA_SHLVL  # fix for https://github.com/conda/conda/issues/9392
if [ -e /Users/cdg4/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/cdg4/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
