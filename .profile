export WORKON_HOME=~/.virtualenvs
alias rmpyc="find . -name *.pyc | xargs rm"
alias projects='cd ~/dev/mainrepo/projects; . ~/.virtualenvs/env/bin/activate'
alias esavvy='source ~/.virtualenvs/env/bin/activate; cd ~/dev/mainrepo/projects/'
export PS1="\!:\w $ "
alias mvim="/Applications/MacVim.app/Contents/MacOS/MacVim"
export PATH=/Users/bryce/.virtualenvs/ddar/bin:$PATH
[[ -s "/Users/bryce/.rvm/scripts/rvm" ]] && source "/Users/bryce/.rvm/scripts/rvm"  # This loads RVM into a shell session.
