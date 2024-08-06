# shellcheck shell=bash

gclgh() {
    local gitpath="$1"
    shift

    local localpath="$HOME/github/$gitpath"
    if [[ -n "$1" ]] && [[ ! "$1" =~ ^-.* ]]; then
        localpath="$1"
        shift
    fi

    mkdir -p "$(dirname "$localpath")"

    git clone "https://github.com/$gitpath" "$localpath" "$@"
}
