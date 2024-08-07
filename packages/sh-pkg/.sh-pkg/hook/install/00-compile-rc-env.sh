#!/bin/bash

COMPILED="$HOME/.sh-pkg/.compiled"

ENVSH_TMP="$COMPILED/envsh.part"
ENVSH="$COMPILED/envsh"

echo "# this file is compiled, DO NOT EDIT DIRECTLY" >"$ENVSH_TMP"

while IFS="" read -r envscript || [ -n "$envscript" ]; do
    {
        echo
        echo "# $envscript"
        cat "$envscript"
    } >>"$ENVSH_TMP"
done < <(find "$HOME/.sh-pkg/env.d/" -type f | sort)

mv "$ENVSH_TMP" "$ENVSH"

RCSH_TMP="$COMPILED/rcsh.part"
RCSH="$COMPILED/rcsh"

echo "# this file is compiled, DO NOT EDIT DIRECTLY" >"$RCSH_TMP"

while IFS="" read -r rcscript || [ -n "$rcscript" ]; do
    {
        echo
        echo "# $rcscript"
        cat "$rcscript"
    } >>"$RCSH_TMP"
done < <(find "$HOME/.sh-pkg/rc.d/" -type f | sort)

mv "$RCSH_TMP" "$RCSH"
