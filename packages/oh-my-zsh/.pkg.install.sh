#!/bin/bash

if [[ -n "$ZSH_VERSION" && -z "$ZSH" ]]; then
  sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi
