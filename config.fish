# export LANG=ja_JP.utf8
alias vi='vim'
alias grep='grep --color'
alias gr='grep --color -n'
alias grr='echo "->" | grep  -rn --color --'
alias fn='find -name'
alias hi='history'
alias ll='ls -la --color=auto'
alias pv='peco | xargs vim'

# mac文字化け
export LESSCHARSET=utf-8
export VAGRANT_WSL_WINDOWS_ACCESS_USER= BPDOMAIN\okada
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH="/mnt/c/Users/okada/jpne"

function fish_user_key_bindings
  bind \cx\cr peco_recentd
end
