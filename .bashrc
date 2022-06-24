# A basic .bashrc file that sets the command prompt to show the current directory,
# protects the novice bash user from some common pitfalls, and adds color to a few
# commands.
#
# This file has been tested on OS X, Windows (Git Bash), and Linux.
# It is used at Princeton University (COS 126 and COS 226) and Coursera
# (Algorithms, Part I and II; Computer Science: Programming with a Purpose).
#
# It is distributed via the IntelliJ/Java installer:
#   https://lift.cs.princeton.edu/java/mac
#   https://lift.cs.princeton.edu/java/windows
#   https://lift.cs.princeton.edu/java/linux

# Written by Kevin Wayne


# Set command prompt to show current directory.
if [ "$TERM" = "xterm-color" ] || [ "$TERM" = "xterm-256color" ]; then

<<<<<<< HEAD
# Set editor
export EDITOR="emacs"
set -o vi
bind '"jk":vi-movement-mode'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
