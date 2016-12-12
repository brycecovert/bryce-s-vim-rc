alias rmpyc="find . -name *.pyc | xargs rm"
export PS1="\!:\w $ "
alias ll="ls -la"
[[ -s "~/.profile.local" ]] && source "~/.profile.local"  # This loads RVM into a shell session.

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
# [[ -s "/Users/brycecovert/.gvm/bin/gvm-init.sh" ]] && source "/Users/brycecovert/.gvm/bin/gvm-init.sh"
