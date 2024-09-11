#!/bin/zsh

COMPILED="$HOME/.sh-pkg/.compiled"

if [[ ! -d "$COMPILED" ]]; then
    mkdir -p "$COMPILED"
fi


ENVSH_TMP="$COMPILED/env.zsh.part"
ENVSH="$COMPILED/env.zsh"

{
    cat <<EOF
# this file is compiled, DO NOT EDIT DIRECTLY

# Prevent looping from possible user scripts
[[ -n "\$__sh_pkg_zsh_rc" ]] && return
__sh_pkg_zsh_rc=true
EOF

    while IFS="" read -r envscript; do
        echo
        echo "# $envscript"
        cat "$envscript"
    done < <("$HOME/bin/sh-pkg" helper find shell=any-posix,zsh -- "$HOME/.sh-pkg/env.d/" -type f | sort)
} > "$ENVSH_TMP"

mv "$ENVSH_TMP" "$ENVSH"


RCSH_TMP="$COMPILED/rc.zsh.part"
RCSH="$COMPILED/rc.zsh"

{
    cat <<EOF
# this file is compiled, DO NOT EDIT DIRECTLY

# Prevent looping from possible user scripts
[[ -n "\$__sh_pkg_zsh_env" ]] && return
__sh_pkg_zsh_env=true
EOF

    while IFS="" read -r rcscript; do
        echo
        echo "# $rcscript"
        cat "$rcscript"
    done < <("$HOME/bin/sh-pkg" helper find shell=any-posix,zsh -- "$HOME/.sh-pkg/rc.d/" -type f | sort)
} > "$RCSH_TMP"

mv "$RCSH_TMP" "$RCSH"
