# sh-pkg:shell any-posix
# shellcheck shell=sh

# TODO: move to functions dir

# Projects
cdp() {
    # shellcheck disable=SC2164
    cd "$(fp "$@")"
}
