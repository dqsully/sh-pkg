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

    any_updated=true
fi

if [[ -f "$HOME/.bash_profile" ]]; then
    echo "Moving $HOME/.bash_profile to $HOME/.sh-pkg/env.d/00-user-bash-profile.sh"
    mkdir -p "$HOME/.sh-pkg/env.d"
    {
        # shellcheck disable=SC2016
        echo '# sh-pkg:shell bash'
        cat "$HOME/.bash_profile"
    } >"$HOME/.sh-pkg/env.d/00-user-bash-profile.sh"

    rm "$HOME/.bash_profile"

    bash_profile_moved=true
    any_updated=true
elif [[ -f "$HOME/.bash_login" ]]; then
    echo "Moving $HOME/.bash_login to $HOME/.sh-pkg/env.d/00-user-bash-login.sh"
    mkdir -p "$HOME/.sh-pkg/env.d"
    {
        # shellcheck disable=SC2016
        echo '# sh-pkg:shell bash'
        cat "$HOME/.bash_login"
    } >"$HOME/.sh-pkg/env.d/00-user-bash-login.sh"

    rm "$HOME/.bash_login"

    bash_login_moved=true
    any_updated=true
fi

if [[ -n "$any_updated" ]]; then
    passwd_line="$(getent passwd "$USER")"
    login_shell="${passwd_line##*/}"
    current_shell="${SHELL##*/}"

    echo '******'
    echo

    if [[ "$current_shell" == "bash" ]]; then
        echo "* Current shell's dotfiles have been updated!, Please reload your shell by"
        echo "  running:"
    else
        echo "* Bash dotfiles have been updated. Restart shells to load new config by running:"
    fi

    echo
    echo "    exec \$SHELL"
    echo

    if [[ "$login_shell" == "bash" ]]; then
        echo "* Your login shell is also Bash! You will need to log out and in again for any"
        echo "  updated environment variables to take effect."
        echo
    fi

    if [[ "$bash_profile_moved" ]]; then
        echo "* .bash_profile was migrated into sh-pkg, but sh-pkg doesn't distinguish between"
        echo "  interactive login/non-login shells, so this will be also be run for non-login"
        echo "  shells too"
        echo
    elif [[ "$bash_login_moved" ]]; then
        echo "* .bash_login was migrated into sh-pkg, but sh-pkg doesn't distinguish between"
        echo "  interactive login/non-login shells, so this will be also be run for non-login"
        echo "  shells too"
        echo
    fi

    echo '******'
fi
