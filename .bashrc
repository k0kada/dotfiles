export LANG=ja_JP.utf8
alias vi='vim'
alias grep='grep --color'
alias fn='find -name'
alias hi='history'

# mac文字化け
export LESSCHARSET=utf-8
# macなら
if [ "$(uname)" = 'Darwin' ]; then
    alias ll='ls -la -G'
else
    alias ll='ls -la --color=auto'
fi
