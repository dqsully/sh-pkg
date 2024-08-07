#!/bin/bash -e

GITCONFIG_TMP="$HOME/.sh-pkg/.compiled/gitconfig.part"
GITCONFIG="$HOME/.sh-pkg/.compiled/gitconfig"

echo "[include]" > "$GITCONFIG_TMP"

while IFS="" read -r gitconf; do
    echo $'\t'"path = $gitconf" >> "$GITCONFIG_TMP"
done < <(find "$HOME/.sh-pkg/git" -type f | sort)

mv "$GITCONFIG_TMP" "$GITCONFIG"
