# shellcheck shell=sh

if [ -n "$BASH_VERSION" ]; then
    # shellcheck disable=SC3046
    source "$HOME/.sh-pkg/.compiled/env.bash"
else
    . "$HOME/.sh-pkg/.compiled/env.sh"
fi
