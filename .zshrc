export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

eval $(/opt/homebrew/bin/brew shellenv)

export PATH=/opt/homebrew/opt/python@3.13/libexec/bin:$PATH
export PATH=/opt/homebrew/opt/llvm/bin:$PATH
