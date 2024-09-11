# `sh-pkg` - a shell package manager

Managing dotfiles and scripts between computers can be a pain... this aims to make that easier!

## Installation

First, make sure `git` is installed, then run:

```bash
curl https://raw.githubusercontent.com/dqsully/sh-pkg/main/install.sh | bash -
```

This will add the `std` remote source pointing to this repository, as well as install the `std/sh-pkg` package, which puts the `sh-pkg` executable in the `~/bin` directory. Note: **until you install a `dotfile-*` package, the `sh-pkg` executable may not be in your PATH.**

To update your shell dotfiles (only Bash and Zsh are currently supported) to work with sh-pkg packages, run:

```bash
~/bin/sh-pkg install dotfile-bash dotfile-zsh
```

**NOTE: this will migrate your `.bashrc`, `.profile`, `.zshenv`, and `.zshrc` files into the sh-pkg dotfile dirs.**
    
## Sources

A "source" is just a named folder of packages. This can be a subdirectory of a Git repository, or just a directory on your local computer.

To add a local source, run
```bash
sh-pkg source add mysourcename path/to/source
```

To add a remote source, run
```bash
sh-pkg source add mysourcename https://github.com/me/mypackages subdir/within/the/repo
```

By default, the `std` source is added during installation and points to this repository.

## Packages

A "package" is a folder with files to copy into a user's home directory. Packages are referred to in a `source/package` format, e.g. `std/sh-pkg` for the package manager itself.

Also, if a source is omitted from a package reference, it's assumed to be part of the `std` source, e.g. `sh-pkg` is the same as `std/sh-pkg`.

To install the `std/aliases-kubectl` package for example, run
```bash
sh-pkg install aliases-kubectl
```

To remove that package, run
```bash
sh-pkg uninstall aliases-kubectl
```

<!-- TODO: update command -->

When writing a package, you can use some special files starting with `.pkg` to add metadata or package hooks:
- `.pkg.info` - plaintext package info
- `.pkg.deps` - newline-delimited package dependencies in `source/package` format, `.` can be used in this file to reference the current source, e.g. `./kubelet`
- `.pkg.preinstall.sh` - preinstall script executed only before installation, best for migrating existing user files (make sure to `chmod +x`)
- `.pkg.install.sh` - script executed during install or update, before files are copied but after installation is validated (make sure to `chmod +x`)

## Database

sh-pkg maintains a basic key-value database with list values for anyone to use. sh-pkg itself uses this database to save information about installed packages and files, but it can also be used for general-purpose configuration, like with the `std/projects` package.

To read or edit any database entries, use the `sh-pkg db` subcommands.

## `~/.sh-pkg`

`~/.sh-pkg` is where sh-pkg stores all of its configuration. The following directories are standard, but packages may add nonstandard ones as well:
- `db` - the sh-pkg database directory
- `env.d` - scripts to compile into a `.zshenv` or `.profile` file, should contain environment variable settings
- `hook` - sh-pkg hooks
    - `install` - scripts to run after any `sh-pkg install` command, e.g. compiling `~/.sh-pkg/env.d`
- `rc.d` - scripts to compile into a `.zshrc` or `.bashrc` file, should contain shell configurations, aliases, and functions
- `remote_sources` - where sh-pkg maintains Git repositories for remote sources
- `sources` - symlinks for each installed source to the source's real location (e.g. to a repo in `remote_sources`)

Directories added by packages

## Implementation status

- [x] Can install and update local or remote package sources
- [x] Packages can be installed
- [x] Packages can have dependencies
- [x] `sh-pkg` can be bootstrapped
- [x] Scripts from `env.d` and `rc.d` are precompiled for speed
- [x] Command to uninstall packages
- [ ] Command to list installed and/or available packages
- [x] Command to print package info
- [ ] Command to update all sources
- [ ] Command to update installed packages
- [x] Support for pre-install hooks
- [ ] Suggested packages
- [ ] More safety around package removal
- [x] Better shell detection (instead of defaulting to zsh if not bash)
- [ ] Package features
    - [ ] brew - installs brew
    - [ ] brew - updates brew
    - [ ] code-insiders - rename to something better
    - [ ] dotnet - install/manage .NET versions?
    - [x] git - migrates existing `.gitconfig`
    - [ ] go - installs go
    - [ ] go - updates go
    - [ ] kubectl - rename to aliases-kubectl
    - [ ] kubectl - add Bash aliases, remove oh-my-zsh dependency
    - [ ] kubie - fix zsh compdef
    - [ ] kubie - add Bash support
    - [ ] nvm - install nvm
    - [ ] nvm - update nvm
    - [ ] nvm - support nvm in Bash
    - [ ] oh-my-zsh - make install compatible
    - [ ] oh-my-posh - create package
    - [ ] projects - rename
    - [ ] pyenv - install pyenv
    - [ ] pyenv - update pyenv
    - [ ] rust - installs rustup
    - [ ] rust - updates cargo packages
    - [x] sh-pkg - migrates existing `.profile`, `.bashrc`, `.zshrc`, and `.zshenv`
    - [ ] sh-pkg - overwrite `.profile`, `.bashrc`, `.zshrc`, and `.zshenv` directly instead of using `.sh-pkg/.compiled` directory
    - [x] sh-pkg - split  Bash/Zsh support into separate packages
