# shellcheck shell=bash

# Use the `nvm` lazy-loading oh-my-zsh plugin
if [ ! "$IS_BASH" ]; then
  plugins=("${plugins[@]}" nvm)

  zstyle ':omz:plugins:nvm' lazy yes
  zstyle ':omz:plugins:nvm' lazy-cmd eslint prettier typescript
  zstyle ':omz:plugins:nvm' autoload yes
  zstyle ':omz:plugins:nvm' silent-autoload yes
else
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# TODO: otherwise load NVM?
