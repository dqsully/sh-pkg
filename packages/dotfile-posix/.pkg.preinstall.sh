#!/bin/bash

if [[ -f "$HOME/.profile" ]]; then
    echo "Moving $HOME/.profile to $HOME/.sh-pkg/env.d/00-user-profile.sh"
    mkdir -p "$HOME/.sh-pkg/env.d"
    {
        # shellcheck disable=SC2016
        echo '# sh-pkg:shell any-posix'
        cat "$HOME/.profile"
    } >"$HOME/.sh-pkg/env.d/00-user-profile.sh"

    rm "$HOME/.profile"
fi

if [[ "${SHELL##*/}" == "bash" || "${SHELL##*/}" == "sh" || "${SHELL##*/}" == "ksh" ]]; then
    cat <<EOF
******

Current shell's dotfiles have been updated!

Please reload your shell with this command:

    exec $SHELL

******

EOF
fi
