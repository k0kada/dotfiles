export LANG=ja_JP.UTF-8
export LANGUAGE=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

alias vi='vim'
alias grep='grep --color'
alias gr='grep --color -n'
# alias grr='echo "->" | grep  -rn --color --'
alias grr='echo "->" | grep  -rn --color=auto'
alias fn='find -name'
alias hi='history'
alias ll='ls -la --color=auto'
alias pv='peco | xargs -o vim'
alias fv='fzf | xargs -o vim'
alias cpv='cut -f 1 -d ":" | pv'
alias cfv='cut -f 1 -d ":" | fv'

# mac文字化け
export LESSCHARSET=utf-8
export VAGRANT_WSL_WINDOWS_ACCESS_USER="BPDOMAIN\okada"
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH="/mnt/c/Users/okada"

set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"

alias gitdiff='git difftool --tool=vimdiff --no-prompt'
