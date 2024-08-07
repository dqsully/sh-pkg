#!/bin/bash

if [[ ! -e "$HOME/.oh-my-zsh" ]]; then
  sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi
