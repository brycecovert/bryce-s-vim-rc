test -e /usr/local/bin/virtualenvwrapper.sh && source /usr/local/bin/virtualenvwrapper.sh
export PATH=/usr/local/bin:$PATH
test -e ~/dev/hg-stable/contrib/bash_completion && source ~/dev/hg-stable/contrib/bash_completion
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
