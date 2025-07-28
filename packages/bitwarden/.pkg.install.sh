#!/bin/bash

echo "Downloading and installing/updating bitwarden CLI..."

platform=

case "$(uname -s)" in
    Linux*) platform="linux" ;;
    Darwin*) platform="macos" ;;
    MINGW*|CYGWIN*|MSYS_NT*) platform="windows" ;;
    *)
        echo "Unknown kernel: $(uname -s)"
        exit 1
        ;;
esac

rm "$HOME/bin/bw"
curl -sSL "https://bitwarden.com/download?app=cli&platform=$platform" -o /tmp/bitwarden.zip || exit
unzip /tmp/bitwarden.zip bw -d "$HOME/bin" || exit
rm /tmp/bitwarden.zip
chmod +x "$HOME/bin/bw"

echo "done"
