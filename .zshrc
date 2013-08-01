
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
autoload -U compinit
compinit
eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"
set -o vi
zstyle ':completion:*' menu select
autoload -U promptinit colors
colors
promptinit

prompt walters
