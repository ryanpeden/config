# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Powerlevel10k
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Paths
export PATH=/opt/homebrew/opt/grep/libexec/gnubin:${PATH}
export PATH=/opt/homebrew/opt/llvm/bin:${PATH}
export PATH=/opt/homebrew/opt/python@3.12/libexec/bin:${PATH}

# Aliases
alias ..="cd ../"
alias l="ls -lha"
alias grep="grep --color=auto"

# Terminal colors
export CLICOLOR=1
