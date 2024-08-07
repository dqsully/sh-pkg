#!/bin/bash

COMPILED="$HOME/.sh-pkg/.compiled"

ENVSH_TMP="$COMPILED/env.sh.part"
ENVSH="$COMPILED/env.sh"

echo "# this file is compiled, DO NOT EDIT DIRECTLY" >"$ENVSH_TMP"

while IFS="" read -r envscript; do
    # Only include posix-compatible scripts
    if sh-pkg helper check "$envscript" shell=any-posix; then
        {
            echo
            echo "# $envscript"
            cat "$envscript"
        } >>"$ENVSH_TMP"
    fi
done < <(find "$HOME/.sh-pkg/env.d/" -type f | sort)

mv "$ENVSH_TMP" "$ENVSH"
