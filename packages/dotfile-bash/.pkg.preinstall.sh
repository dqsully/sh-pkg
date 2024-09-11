#!/bin/bash

if [[ -f "$HOME/.bashrc" ]]; then
    echo "Moving $HOME/.bashrc to $HOME/.sh-pkg/rc.d/00-user-bashrc.sh"
    mkdir -p "$HOME/.sh-pkg/rc.d"
    {
        # shellcheck disable=SC2016
        echo '# sh-pkg:shell bash'
        cat "$HOME/.bashrc"
    } >"$HOME/.sh-pkg/rc.d/00-user-bashrc.sh"

    rm "$HOME/.bashrc"
fi
