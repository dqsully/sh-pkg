#!/bin/bash

if [[ -f "$HOME/.profile" ]]; then
    echo "Moving $HOME/.profile to $HOME/.sh-pkg/env.d/00-user-profile.sh"
    mkdir -p "$HOME/.sh-pkg/env.d"
    {
        # shellcheck disable=SC2016
        if [[ -f "$HOME/.bash_profile" || -f "$HOME/.bash_login" ]]; then
            echo '# sh-pkg:shell any-posix !bash'
        else
            echo '# sh-pkg:shell any-posix'
        fi
        cat "$HOME/.profile"
    } >"$HOME/.sh-pkg/env.d/00-user-profile.sh"

    rm "$HOME/.profile"

    sh_profile_moved=true
    any_updated=true
fi

if [[ -n "$any_updated" ]]; then
    passwd_line="$(getent passwd "$USER")"
    login_shell="${passwd_line##*/}"
    current_shell="${SHELL##*/}"

    echo '******'
    echo

    if [[ "$current_shell" == "sh" || ("$current_shell" == "bash" && ! -f "$HOME/.bash_profile" && ! -f "$HOME/.bash_login") ]]; then
        echo "* Current shell's dotfiles have been updated!, Please reload your shell by"
        echo "  running:"
    else
        echo "* sh dotfiles have been updated. Restart shells to load new config by running:"
    fi

    echo
    echo "    exec \$SHELL"
    echo

    if [[ "$login_shell" == "bash" ]]; then
        echo "* Your login shell is also Bash! You will need to log out and in again for any"
        echo "  updated environment variables to take effect."
        echo
    fi

    if [[ "$sh_profile_moved" ]]; then
        echo "* .profile was migrated into sh-pkg, but sh-pkg doesn't distinguish between"
        echo "  interactive login/non-login shells, so this will be also be run for non-login"
        if [[ -f "$HOME/.bash_profile" || -f "$HOME/.bash_login" ]]; then
            echo "  shells too (except for Bash, since you have a .bash_profile/.bash_login file)"
        else
            echo "  shells too"
        fi
        echo
    fi

    echo '******'
fi

