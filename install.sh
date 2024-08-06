#!/bin/bash

mkdir -p ~/.sh-pkg/sources ~/.sh-pkg/remote-sources
git clone https://github.com/dqsully/sh-pkg ~/.sh-pkg/remote-sources/std
ln -s ~/.sh-pkg/remote-sources/std ~/.sh-pkg/sources/std
~/.sh-pkg/sources/std/packages/sh-pkg/bin/sh-pkg install std/sh-pkg
