alias rmpyc="find . -name *.pyc | xargs rm"
export PS1="\!:\w $ "
alias ll="ls -la"
[[ -s "~/.profile.local" ]] && source "~/.profile.local"  # This loads RVM into a shell session.
