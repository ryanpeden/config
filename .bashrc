parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export BASH_SILENCE_DEPRECATION_WARNING=1

eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

export PATH="$(brew --prefix)/opt/llvm/bin:${PATH}"

export CLICOLOR=1
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[0;32m\]\$(parse_git_branch)\[\033[00m\] \$ "

alias ..="cd ../"
alias ...="cd ../../"
alias e="vim"
alias g="git"
alias grep="grep --color"
alias l="ls -lha"
