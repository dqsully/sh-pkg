# shellcheck shell=bash

# Projects
cdp() {
    # shellcheck disable=SC2164
    cd "$(fp "$@")"
}
