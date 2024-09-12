# shellcheck shell=sh

# This file is managed by sh-pkg, DO NOT EDIT DIRECTLY
#
# Session environment variables and interactive shell setup scripts can be added
# to ~/.sh-pkg/env.d and ~/.sh-pkg/rc.d respectively, and running the command
# `sh-pkg hook install` will recompile the directories into dotfile scripts.

# Bourne-compatible (e.g. /bin/sh) login shell. Not much we can safely do here,
# but include our environment variables just in case.
. "$HOME/.sh-pkg/.compiled/env.sh"
