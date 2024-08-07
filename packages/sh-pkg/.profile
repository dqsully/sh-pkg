#!/bin/bash
# shellcheck disable=SC1091
# shellcheck disable=SC2034

if [ -n "$BASH_VERSION" ]; then
    # The envsh should work for Bash as well
    IS_BASH=true
    source "$HOME/.sh-pkg/.compiled/envsh"
fi
