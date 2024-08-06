# `sh-pkg` - a shell package manager

Managing dotfiles and scripts between computers can be a pain... this aims to make that easier!

## Installation

First, make sure `git` is installed, then run:

```bash
curl https://raw.githubusercontent.com/dqsully/sh-pkg/main/install.sh | bash -
```

This will add the `std` remote source pointing to this repository, as well as install the `std/sh-pkg` package.

## Implementation status

- [x] Can install and update local or remote package sources
- [x] Packages can be installed
- [x] Packages can have dependencies
- [x] `sh-pkg` can be bootstrapped
- [ ] Scripts from `env.d` and `rc.d` are precompiled for speed
- [ ] Command to uninstall packages
- [ ] Command to list installed and/or available packages
- [ ] Command to print package info
- [ ] Command to update installed packages
- [ ] Command to update all sources
- [ ] Pre-install hooks to migrate existing `.profile`, `.bashrc`, `.zshrc`, `.zshenv`, `.gitconfig`, etc.
- [ ] More safety around package removal
- [ ] Package features
    - [ ] brew - installs brew
    - [ ] brew - updates brew
    - [x] git - migrates existing `.gitconfig`
    - [ ] rust - installs rustup
    - [ ] rust - updates cargo packages
    - [ ] sh-pkg - migrates existing `.profile`, `.bashrc`, `.zshrc`, and `.zshenv`
