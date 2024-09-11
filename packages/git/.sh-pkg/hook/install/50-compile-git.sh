#!/bin/bash -e

COMPILED="$HOME/.sh-pkg/.compiled"

if [[ ! -d "$COMPILED" ]]; then
    mkdir -p "$COMPILED"
fi

GITCONFIG_TMP="$COMPILED/gitconfig.part"
GITCONFIG="$COMPILED/gitconfig"

echo "[include]" > "$GITCONFIG_TMP"

while IFS="" read -r gitconf; do
    echo $'\t'"path = $gitconf" >> "$GITCONFIG_TMP"
done < <(find "$HOME/.sh-pkg/git" -type f | sort)

mv "$GITCONFIG_TMP" "$GITCONFIG"
