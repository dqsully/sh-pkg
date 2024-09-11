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

    any_updated=true
fi

if [[ -f "$HOME/.zshprofile" ]]; then
    echo "Moving $HOME/.zshprofile to $HOME/.sh-pkg/env.d/00-user-zshprofile.sh"
    mkdir -p "$HOME/.sh-pkg/env.d"
    {
        # shellcheck disable=SC2016
        echo '# sh-pkg:shell zsh'
        cat "$HOME/.zshprofile"
    } >"$HOME/.sh-pkg/env.d/00-user-zshprofile.sh"

    rm "$HOME/.zshprofile"

    zsh_profile_moved=true
    any_updated=true
fi

if [[ -n "$any_updated" ]]; then
    passwd_line="$(getent passwd "$USER")"
    login_shell="${passwd_line##*/}"
    current_shell="${SHELL##*/}"

    echo '******'
    echo

    if [[ "$current_shell" == "zsh" ]]; then
        echo "* Current shell's dotfiles have been updated!, Please reload your shell by"
        echo "  running:"
    else
        echo "* Zsh dotfiles have been updated. Restart shells to load new config by running:"
    fi

    echo
    echo "    exec \$SHELL"
    echo

    if [[ "$login_shell" == "zsh" ]]; then
        echo "* Your login shell is also Zsh! You will need to log out and in again for any"
        echo "  updated environment variables to take effect."
        echo
    fi

    if [[ "$zsh_profile_moved" ]]; then
        echo "* .zshprofile was migrated into sh-pkg, but sh-pkg doesn't distinguish between"
        echo "  interactive login/non-login shells, so this will be also be run for non-login"
        echo "  shells too"
        echo
    fi

    echo '******'
fi
