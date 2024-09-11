# shellcheck shell=bash

# .bash_profile is only used when Bash is executed as a login shell, interactive
# or not. When this file is present, Bash will ignore the .profile file unless
# executed as `sh` instead.

# Always include envs, since this likely includes PATH variables and more that
# can be very helpful
source "$HOME/.sh-pkg/.compiled/env.bash"

# If the session is interactive, then include the interactive shell setup as
# well (sh-pkg has no distinction between interactive login/non-login shells)
if [[ $- == *i* ]]; then
    source "$HOME/.sh-pkg/.compiled/rc.bash"
fi
