#!/bin/bash

mkdir -p ~/.sh-pkg/git ~/.sh-pkg/.compiled

if [[ -f "$HOME/.gitconfig" ]]; then
    echo "Moving $HOME/.gitconfig to $HOME/.sh-pkg/git/00-user-gitconfig"
    mv "$HOME/.gitconfig" "$HOME/.sh-pkg/git/00-user-gitconfig"
fi
