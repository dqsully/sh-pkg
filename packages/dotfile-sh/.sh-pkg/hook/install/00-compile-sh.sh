#!/bin/bash

COMPILED="$HOME/.sh-pkg/.compiled"

if [[ ! -d "$COMPILED" ]]; then
    mkdir -p "$COMPILED"
fi


ENVSH_TMP="$COMPILED/env.sh.part"
ENVSH="$COMPILED/env.sh"

{
    cat <<EOF
# this file is compiled, DO NOT EDIT DIRECTLY

# Prevent looping from possible user scripts
[ -n "\$__sh_pkg_sh_rc" ] && return
__sh_pkg_sh_rc=true
EOF

    while IFS="" read -r envscript; do
        echo
        echo "# $envscript"
        cat "$envscript"
    done < <("$HOME/bin/sh-pkg" helper find shell=any-posix -- "$HOME/.sh-pkg/env.d/" -type f | sort)
} > "$ENVSH_TMP"

mv "$ENVSH_TMP" "$ENVSH"
