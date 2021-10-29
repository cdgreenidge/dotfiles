setopt no_global_rcs  # Make sure nothing spooky happens
export OMP_NUM_THREADS=4
export PATH=$PATH:~/bin
unset CONDA_SHLVL  # fix for https://github.com/conda/conda/issues/9392
if [ -e /Users/cdg4/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/cdg4/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
