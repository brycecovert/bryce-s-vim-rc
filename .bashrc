export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
set -o vi
source ~/.bashrc.local
eval "$(fasd --init auto)"
