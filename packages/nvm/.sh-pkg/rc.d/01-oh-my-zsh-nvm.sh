# sh-pkg:shell zsh
# shellcheck shell=bash

# Use the `nvm` lazy-loading oh-my-zsh plugin
plugins+=(nvm)

zstyle ':omz:plugins:nvm' lazy yes
zstyle ':omz:plugins:nvm' lazy-cmd eslint prettier typescript
zstyle ':omz:plugins:nvm' autoload yes
zstyle ':omz:plugins:nvm' silent-autoload yes
