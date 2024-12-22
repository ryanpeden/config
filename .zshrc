# Use Powerlevel10k theme
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Homebrew setup
eval "$(/opt/homebrew/bin/brew shellenv)"

# Paths
export PATH=/opt/homebrew/opt/grep/libexec/gnubin:${PATH}
export PATH=/opt/homebrew/opt/llvm/bin:${PATH}
export PATH=/opt/homebrew/opt/python@3.12/libexec/bin:${PATH}

# Aliases
alias ..="cd ../"
alias l="ls -lha"
alias grep="grep --color=auto"

# Enable colors in terminal
export CLICOLOR=1
