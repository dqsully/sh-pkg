#!/bin/zsh

if [[ -n "$BASH_VERSION" ]]; then
    IS_BASH=true
fi

source "$HOME/.sh-pkg/.compiled/rcsh"
