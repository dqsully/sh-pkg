# sh-pkg:shell any-posix
# shellcheck shell=sh

alias kgn="kubectl get node"
alias kdn="kubectl describe node"
alias kdeln="kubectl delete node"
alias kg="kubectl get"
alias kd="kubectl describe"
alias ke="kubectl edit"
alias kdel="kubectl delete"
alias kdelpa="kdelp --all"
alias kcf="kubectl create -f"
alias krf="kubectl replace -f"
alias kdr="kubectl drain --ignore-daemonsets"
alias kdrf="kdr --delete-emptydir-data --force"
alias kcd="kubectl cordon"
alias kucd="kubectl uncordon"
