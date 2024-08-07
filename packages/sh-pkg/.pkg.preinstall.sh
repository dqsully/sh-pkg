#!/bin/bash

mkdir -p ~/.sh-pkg/git ~/.sh-pkg/.compiled

if [[ -f "$HOME/.bashrc" ]]; then
    echo "Moving $HOME/.bashrc to $HOME/.sh-pkg/rc.d/00-user-bashrc.sh"
    {
        # shellcheck disable=SC2016
        echo 'if [ "$IS_BASH" ]; then'
        cat "$HOME/.bashrc"
        echo 'fi'
    } >"$HOME/.sh-pkg/rc.d/00-user-bashrc.sh"

    rm "$HOME/.bashrc"
fi

if [[ -f "$HOME/.profile" ]]; then
    echo "Moving $HOME/.profile to $HOME/.sh-pkg/env.d/00-user-profile.sh"
    {
        # shellcheck disable=SC2016
        echo 'if [ "$IS_BASH" ]; then'
        cat "$HOME/.profile"
        echo 'fi'
    } >"$HOME/.sh-pkg/env.d/00-user-profile.sh"

    rm "$HOME/.profile"
fi
