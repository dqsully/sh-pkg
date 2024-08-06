#!/bin/bash -e

echo "[include]" > ~/.sh-pkg/.compiled/git-config.part

while IFS="" read -r gitconf || [ -n "$gitconf" ]; do
    echo $'\t'"path = \"$gitconf\""
done < <(find "$HOME/.sh-pkg/git" -type f | sort)

mv ~/.sh-pkg/.compiled/git-config.part ~/.sh-pkg/.compiled/git-config
