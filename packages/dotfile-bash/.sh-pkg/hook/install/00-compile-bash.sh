#!/bin/bash

COMPILED="$HOME/.sh-pkg/.compiled"

if [[ ! -d "$COMPILED" ]]; then
    mkdir -p "$COMPILED"
fi

ENVSH_TMP="$COMPILED/env.bash.part"
ENVSH="$COMPILED/env.bash"

echo "# this file is compiled, DO NOT EDIT DIRECTLY" >"$ENVSH_TMP"

while IFS="" read -r envscript; do
    echo
    echo "# $envscript"
    cat "$envscript"
done >>"$ENVSH_TMP" < <(sh-pkg helper find shell=any-posix,bash -- "$HOME/.sh-pkg/env.d/" -type f | sort)

mv "$ENVSH_TMP" "$ENVSH"

RCSH_TMP="$COMPILED/rc.bash.part"
RCSH="$COMPILED/rc.bash"

echo "# this file is compiled, DO NOT EDIT DIRECTLY" >"$RCSH_TMP"

while IFS="" read -r rcscript; do
    echo
    echo "# $rcscript"
    cat "$rcscript"
done >>"$RCSH_TMP" < <(sh-pkg helper find shell=any-posix,bash -- "$HOME/.sh-pkg/rc.d/" -type f | sort)

mv "$RCSH_TMP" "$RCSH"
