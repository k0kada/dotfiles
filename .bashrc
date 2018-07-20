export LANG=ja_JP.utf8
alias vi='vim'
alias grep='grep --color'
alias fn='find -name'
alias hi='history'
alias gr='echo "->" | grep  -r --color --'

# mac文字化け
export LESSCHARSET=utf-8
# macなら
if [ "$(uname)" = 'Darwin' ]; then
    alias ll='ls -la -G'
else
    alias ll='ls -la --color=auto'
fi

function ssh() {
    # tmux起動時
    if [[ -n $(printenv TMUX) ]] ; then
        # 現在のペインIDを退避
        local pane_id=$(tmux display -p '#{pane_id}')
        # 接続先ホスト名に応じて背景色を切り替え
        if [[ `echo $1 | grep 'prd'` ]] ; then
            tmux select-pane -P 'bg=colour52,fg=white'
        elif [[ `echo $1 | grep 'stg'` ]] ; then
            tmux select-pane -P 'bg=colour58,fg=white'
        elif [[ `echo $1 | grep 'dev'` ]] ; then
            tmux select-pane -P 'bg=colour95,fg=white'
        fi

        # 通常通りssh続行
        command ssh $@

        # デフォルトの背景色に戻す
        tmux select-pane -t $pane_id -P 'default'
    else
        command ssh $@
    fi
}

# path処理
path_append()  { path_remove $1; export PATH="$PATH:$1"; }
path_prepend() { path_remove $1; export PATH="$1:$PATH"; }
path_remove()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }
