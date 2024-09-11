#!/bin/bash

mkdir -p ~/.sh-pkg/sources ~/.sh-pkg/remote_sources
git clone https://github.com/dqsully/sh-pkg ~/.sh-pkg/remote_sources/std
ln -s ~/.sh-pkg/remote_sources/std/packages ~/.sh-pkg/sources/std
~/.sh-pkg/sources/std/sh-pkg/bin/sh-pkg install sh-pkg
