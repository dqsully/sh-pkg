#!/bin/bash

COMPILED="$HOME/.sh-pkg/.compiled"

if [[ ! -d "$COMPILED" ]]; then
    mkdir -p "$COMPILED"
fi

ENVSH_TMP="$COMPILED/env.sh.part"
ENVSH="$COMPILED/env.sh"

echo "# this file is compiled, DO NOT EDIT DIRECTLY" >"$ENVSH_TMP"

while IFS="" read -r envscript; do
    echo
    echo "# $envscript"
    cat "$envscript"
done >>"$ENVSH_TMP" < <("$HOME/bin/sh-pkg" helper find shell=any-posix -- "$HOME/.sh-pkg/env.d/" -type f | sort)

mv "$ENVSH_TMP" "$ENVSH"
