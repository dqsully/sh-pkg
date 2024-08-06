#!/bin/zsh

if [[ -n "$BASH_VERSION" ]]; then
    IS_BASH=true
fi

# TODO: precompile scripts into a single shell script instead of executing them
# like this

# Execute local env files
while IFS="" read -r envfile || [ -n "$envfile" ]; do
    source "$envfile"
done < <(find "$HOME/.sh-pkg/env.d" -type f | sort)
