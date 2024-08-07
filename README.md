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
- [x] Scripts from `env.d` and `rc.d` are precompiled for speed
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
    
## Sources

A "source" is just a named folder of packages. This can be a subdirectory of a Git repository, or just a directory on your local computer.

To add a local source, run
```bash
sh-pkg source add mysourcename path/to/source
```

To add a remote source, run
```bash
sh-pkg source add mysourcename https://github.com/me/mypackages packages/subdir
```

By default, the `std` source is added during installation and points to this repository.

## Packages

A "package" is a folder with files to copy into a user's home directory, except for files which start with `.pkg` that have special meanings:
- `.pkg.info` - plaintext package info
- `.pkg.deps` - newline-delimited package dependencies
- `.pkg.preinstall.sh` - preinstall script executed only before installation, best for migrating existing user files
- `.pkg.install.sh` - script executed during install or update, before files are copied but after installation is validated

Packages are referred to in a `source/package` format, e.g. `std/sh-pkg` for the package manager itself.

To install the `std/kubectl` package for example, run
```bash
sh-pkg install std/kubectl
```

As of yet, there is no way to remove a package, but you can reinstall a package just by running the `sh-pkg install` command again.

## Database

sh-pkg maintains a basic key-value database with list values for anyone to use. sh-pkg itself uses this database to save information about installed packages and files, but it can also be used for general-purpose configuration, like with the `std/projects` package.

To read or edit any database entries, use the `sh-pkg db` subcommands.

## `~/.sh-pkg`

`~/.sh-pkg` is where sh-pkg stores all of its configuration. The following directories are standard, but packages may and nonstandard ones as well:
- `db` - the sh-pkg database directory
- `env.d` - scripts to compile into a `.zshenv` or `.profile` file, should contain environment variable settings
- `hook` - sh-pkg hooks
    - `install` - scripts to run after any `sh-pkg install` command, e.g. compiling `~/.sh-pkg/env.d`
- `rc.d` - scripts to compile into a `.zshrc` or `.bashrc` file, should contain shell configurations, aliases, and functions
- `remote_sources` - where sh-pkg maintains Git repositories for remote sources
` sources` - symlinks for each installed source to the source's real location (e.g. to a repo in `remote_sources`)