#!/bin/bash

COMPILED="$HOME/.sh-pkg/.compiled"

if [[ ! -d "$COMPILED" ]]; then
    mkdir -p "$COMPILED"
fi


ENVSH_TMP="$COMPILED/env.bash.part"
ENVSH="$COMPILED/env.bash"

{
    cat <<EOF
# this file is compiled, DO NOT EDIT DIRECTLY

# Prevent looping from possible user scripts
[[ -n "\$__sh_pkg_bash_rc" ]] && return
__sh_pkg_bash_rc=true
EOF

    while IFS="" read -r envscript; do
        echo
        echo "# $envscript"
        cat "$envscript"
    done < <("$HOME/bin/sh-pkg" helper find shell=any-posix,bash -- "$HOME/.sh-pkg/env.d/" -type f | sort)
} > "$ENVSH_TMP"

mv "$ENVSH_TMP" "$ENVSH"


RCSH_TMP="$COMPILED/rc.bash.part"
RCSH="$COMPILED/rc.bash"

{
    cat <<EOF
# this file is compiled, DO NOT EDIT DIRECTLY

# Prevent looping from possible user scripts
[[ -n "\$__sh_pkg_bash_env" ]] && return
__sh_pkg_bash_env=true
EOF

    while IFS="" read -r rcscript; do
        echo
        echo "# $rcscript"
        cat "$rcscript"
    done < <("$HOME/bin/sh-pkg" helper find shell=any-posix,bash -- "$HOME/.sh-pkg/rc.d/" -type f | sort)
} > "$RCSH_TMP"

mv "$RCSH_TMP" "$RCSH"
