# shellcheck shell=bash

# This file is managed by sh-pkg, DO NOT EDIT DIRECTLY
#
# Session environment variables and interactive shell setup scripts can be added
# to ~/.sh-pkg/env.d and ~/.sh-pkg/rc.d respectively, and running the command
# `sh-pkg hook install` will recompile the directories into dotfile scripts.

# .zshrc is executed by Zsh for any interactive shells, login or not. Include
# non-interactive and interactive init scripts
source "$HOME/.sh-pkg/.compiled/env.zsh"
source "$HOME/.sh-pkg/.compiled/rc.zsh"
