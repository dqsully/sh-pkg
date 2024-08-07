#!/bin/bash

COMPILED="$HOME/.sh-pkg/.compiled"

ENVSH_TMP="$COMPILED/env.bash.part"
ENVSH="$COMPILED/env.bash"

echo "# this file is compiled, DO NOT EDIT DIRECTLY" >"$ENVSH_TMP"

while IFS="" read -r envscript; do
    # Only include bash-compatible scripts
    if sh-pkg helper check "$envscript" shell=any-posix,bash; then
        {
            echo
            echo "# $envscript"
            cat "$envscript"
        } >>"$ENVSH_TMP"
    fi
done < <(find "$HOME/.sh-pkg/env.d/" -type f | sort)

mv "$ENVSH_TMP" "$ENVSH"

RCSH_TMP="$COMPILED/rc.bash.part"
RCSH="$COMPILED/rc.bash"

echo "# this file is compiled, DO NOT EDIT DIRECTLY" >"$RCSH_TMP"

while IFS="" read -r rcscript; do
    # Only include bash-compatible scripts
    if sh-pkg helper check "$rcscript" shell=any-posix,bash; then
        {
            echo
            echo "# $rcscript"
            cat "$rcscript"
        } >>"$RCSH_TMP"
    fi
done < <(find "$HOME/.sh-pkg/rc.d/" -type f | sort)

mv "$RCSH_TMP" "$RCSH"
