# shellcheck shell=bash

# This file is managed by sh-pkg, DO NOT EDIT DIRECTLY
#
# Session environment variables and interactive shell setup scripts can be added
# to ~/.sh-pkg/env.d and ~/.sh-pkg/rc.d respectively, and running the command
# `sh-pkg hook install` will recompile the directories into dotfile scripts.

# .zshprofile is used when Zsh is executed as a login shell, interactive or not.

# Always include envs, since this likely includes PATH variables and more that
# can be very helpful
source "$HOME/.sh-pkg/.compiled/env.zsh"

# No need to include rc.zsh here since an interactive Zsh shell will always
# execute ~/.zshrc, whether it's a login shell or not.
