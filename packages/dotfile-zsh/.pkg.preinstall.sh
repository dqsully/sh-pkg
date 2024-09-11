#!/bin/bash


if [[ -f "$HOME/.zshrc" ]]; then
    echo "Moving $HOME/.zshrc to $HOME/.sh-pkg/rc.d/00-user-zshrc.sh"
    mkdir -p "$HOME/.sh-pkg/rc.d"
    {
        # shellcheck disable=SC2016
        echo '# sh-pkg:shell zsh'
        cat "$HOME/.zshrc"
    } >"$HOME/.sh-pkg/rc.d/00-user-zshrc.sh"

    rm "$HOME/.zshrc"
fi

if [[ -f "$HOME/.zshenv" ]]; then
    echo "Moving $HOME/.zshenv to $HOME/.sh-pkg/env.d/00-user-zshenv.sh"
    mkdir -p "$HOME/.sh-pkg/env.d"
    {
        # shellcheck disable=SC2016
        echo '# sh-pkg:shell zsh'
        cat "$HOME/.zshenv"
    } >"$HOME/.sh-pkg/env.d/00-user-zshenv.sh"

    rm "$HOME/.zshenv"
fi
