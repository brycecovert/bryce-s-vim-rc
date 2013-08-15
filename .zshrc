# zstyle ':completion:*' menu select
# autoload -U promptinit colors
# colors
# promptinit

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh_custom
#
# # Set name of the theme to load.
# # Look in ~/.oh-my-zsh/themes/
# # Optionally, if you set this to "random", it'll load a random theme each
# # time that oh-my-zsh is loaded.
ZSH_THEME="ys"
#
# # Example aliases
# # alias zshconfig="mate ~/.zshrc"
# # alias ohmyzsh="mate ~/.oh-my-zsh"
#
# # Set to this to use case-sensitive completion
# # CASE_SENSITIVE="true"
#
# # Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"
#
# # Uncomment to change how often before auto-updates occur? (in days)
# # export UPDATE_ZSH_DAYS=13
#
# # Uncomment following line if you want to disable colors in ls
# # DISABLE_LS_COLORS="true"
#
# # Uncomment following line if you want to disable autosetting terminal title.
# # DISABLE_AUTO_TITLE="true"
#
# # Uncomment following line if you want to disable command autocorrection
# # DISABLE_CORRECTION="true"
#
# # Uncomment following line if you want red dots to be displayed while waiting for completion
# # COMPLETION_WAITING_DOTS="true"
#
# # Uncomment following line if you want to disable marking untracked files under
# # VCS as dirty. This makes repository status check for large repositories much,
# # much faster.
# # DISABLE_UNTRACKED_FILES_DIRTY="true"
#
# # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# # Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git fasd osx rake brew mercurial rvm)
#
source $ZSH/oh-my-zsh.sh
#
# # Customize to your needs...
#
# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background and the font Inconsolata.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
# 
# http://ysmood.org/wp/2013/03/my-ys-terminal-theme/
# Mar 2013 ys

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# Git info.
local git_info='$(git_prompt_info)'
local hg_info='$(hg prompt "{branch} " 2>/dev/null)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}on%{$reset_color%} git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}o"

ZSH_THEME_HG_PROMPT_PREFIX=" %{$fg[white]%}on%{$reset_color%} hg:%{$fg[cyan]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_HG_PROMPT_CLEAN=" %{$fg[green]%}o"

# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $ 
precmd() { print -rP "
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$fg[cyan]%}%n \
%{$fg[white]%}at \
%{$fg[green]%}$(box_name) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info} \
%{$fg[cyan] %}\
${hg_info} \
%{$fg[white]%}[%*]"
}

PROMPT="%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"

set -o vi
bindkey -v
bindkey \\C-R history-incremental-search-backward
bindkey \\C-F history-incremental-search-forward
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

setopt appendhistory
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^X^A' fasd-complete
bindkey '^X^F' fasd-complete-f
bindkey '^X^D' fasd-complete-d

alias -s log="tail -f"

bindkey -v \\C-e copy-prev-shell-word

setopt autopushd pushdminus pushdsilent pushdtohome

[[ -f ~/.zshrc.local ]] &&  source ~/.zshrc.local
