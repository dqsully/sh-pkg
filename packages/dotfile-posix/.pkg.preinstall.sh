#!/bin/bash

if [[ -f "$HOME/.profile" ]]; then
    echo "Moving $HOME/.profile to $HOME/.sh-pkg/env.d/00-user-profile.sh"
    {
        # shellcheck disable=SC2016
        echo '# sh-pkg:shell any-posix'
        cat "$HOME/.profile"
    } >"$HOME/.sh-pkg/env.d/00-user-profile.sh"

    rm "$HOME/.profile"
fi
