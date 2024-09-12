# shellcheck shell=bash

# This file is managed by sh-pkg, DO NOT EDIT DIRECTLY
#
# Session environment variables and interactive shell setup scripts can be added
# to ~/.sh-pkg/env.d and ~/.sh-pkg/rc.d respectively, and running the command
# `sh-pkg hook install` will recompile the directories into dotfile scripts.

# .bashrc is executed by Bash only for non-login interactive shells. Include
# env and interactive init scripts.
source "$HOME/.sh-pkg/.compiled/env.bash"
source "$HOME/.sh-pkg/.compiled/rc.bash"
