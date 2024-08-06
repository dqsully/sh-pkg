#!/bin/zsh

if [[ -n "$BASH_VERSION" ]]; then
    IS_BASH=true
fi

# TODO: precompile scripts into a single shell script instead of executing them
# like this

# Execute local rc files
while IFS="" read -r rcfile || [ -n "$rcfile" ]; do
    source "$rcfile"
done < <(find "$HOME/.sh-pkg/rc.d" -type f | sort)
