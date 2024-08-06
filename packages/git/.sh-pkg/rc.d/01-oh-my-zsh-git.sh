# shellcheck shell=bash

if [ ! "$IS_BASH" ]; then
  plugins=("${plugins[@]}" git)
fi
