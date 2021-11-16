# .zshrc
# Explicitly configured $PATH variable

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="xiong-chiamiov-plus"
#ZSH_THEME="wezm"
#ZSH_THEME=pygmalion
ZSH_THEME=agnoster

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(colored-man-pages
         sudo command-not-found
         autojump
         extract
         git
         brew macos
         tmux
         docker docker-compose
         python pip
        )

source $ZSH/oh-my-zsh.sh

# Shell Aliases

# Git Aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '

# Shell Functions
# qfind - used to quickly find files that contain a string in a directory
qfind () {
  find . -exec grep -l -s $1 {} \;
  return 0
}

alias grep='grep --color=auto'

setopt inc_append_history
setopt share_history

# anaconda
# export PATH=~/miniconda3/bin:$PATH

# CUDA
# export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

# brew bottles tuna
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

[[ -s /home/hxbai/.autojump/etc/profile.d/autojump.sh ]] && source /home/hxbai/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/hxbai/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/hxbai/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/hxbai/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/hxbai/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

