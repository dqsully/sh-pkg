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

if [[ "${SHELL##*/}" == "bash" ]]; then
    cat <<EOF
******

Current shell's dotfiles have been updated!

Please reload your shell with this command:

    exec $SHELL

******

EOF
fi
