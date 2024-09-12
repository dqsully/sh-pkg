# shellcheck shell=bash

# This file is managed by sh-pkg, DO NOT EDIT DIRECTLY
#
# Session environment variables and interactive shell setup scripts can be added
# to ~/.sh-pkg/env.d and ~/.sh-pkg/rc.d respectively, and running the command
# `sh-pkg hook install` will recompile the directories into dotfile scripts.

# .bash_profile is only used when Bash is executed as a login shell, interactive
# or not. When this file is present, Bash will ignore the .profile file unless
# executed as `sh` instead.

# Always include envs, since this likely includes PATH variables and more that
# can be very helpful for a user session.
source "$HOME/.sh-pkg/.compiled/env.bash"

# If the session is interactive, then include the interactive shell setup as
# well, since Bash skips .bashrc for login shells
if [[ $- == *i* ]]; then
    source "$HOME/.sh-pkg/.compiled/rc.bash"
fi
