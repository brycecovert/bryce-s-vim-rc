export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
set -o vi
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local
eval "$(fasd --init auto)"

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/brycecovert/.gvm/bin/gvm-init.sh" ]] && source "/Users/brycecovert/.gvm/bin/gvm-init.sh"
