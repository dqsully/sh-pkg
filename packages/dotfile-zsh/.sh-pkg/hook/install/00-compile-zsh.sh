#!/bin/bash

COMPILED="$HOME/.sh-pkg/.compiled"

ENVSH_TMP="$COMPILED/env.zsh.part"
ENVSH="$COMPILED/env.zsh"

echo "# this file is compiled, DO NOT EDIT DIRECTLY" >"$ENVSH_TMP"

while IFS="" read -r envscript; do
    echo
    echo "# $envscript"
    cat "$envscript"
done >>"$ENVSH_TMP" < <(sh-pkg helper find shell=any-posix,zsh -- "$HOME/.sh-pkg/env.d/" -type f | sort)

mv "$ENVSH_TMP" "$ENVSH"

RCSH_TMP="$COMPILED/rc.zsh.part"
RCSH="$COMPILED/rc.zsh"

echo "# this file is compiled, DO NOT EDIT DIRECTLY" >"$RCSH_TMP"

while IFS="" read -r rcscript; do
    echo
    echo "# $rcscript"
    cat "$rcscript"
done >>"$RCSH_TMP" < <(sh-pkg helper find shell=any-posix,zsh -- "$HOME/.sh-pkg/rc.d/" -type f | sort)

mv "$RCSH_TMP" "$RCSH"
