eval "$(/opt/homebrew/bin/brew shellenv)"

path=(
    /opt/homebrew/opt/grep/libexec/gnubin
    /opt/homebrew/opt/llvm/bin
    /opt/homebrew/opt/python@3.13/libexec/bin
    $path
)

export EDITOR='vim'
export PYTHONBREAKPOINT=ipdb.set_trace

alias ..='cd ..'
alias ...='cd ../..'
alias e='vim'
alias grep='grep --color=auto'
alias g='grep'
alias ls='ls -G'
alias l='ls -lah'
alias p='pwd -P'
alias rl='readlink'
alias rm='rm -i'

alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gl='git log'
alias gs='git status'
alias gst='git stash'

autoload -Uz colors && colors
export LSCOLORS="gxfxcxdxbxegedabagacad"

parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/ (\1)/p'
}

setopt PROMPT_SUBST
export PROMPT='%F{green}%n%f@%F{cyan}%m%f:%F{yellow}%~%f%F{magenta}$(parse_git_branch)%f %F{white}$%f '

[[ -f "$HOME/.venv/bin/activate" ]] && source "$HOME/.venv/bin/activate"
