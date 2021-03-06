"dein Scripts-----------------------------
" https://qiita.com/delphinus/items/00ff2c0ba972c6e41542
" https://qiita.com/suy0n9/items/2c33b3982530a1666d9c
if &compatible
  set nocompatible               " Be iMproved
endif

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" __________ここから独自
" vim位置記憶
augroup vimrcEx
    au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
                \ exe "normal g`\"" | endif
augroup END

set encoding=utf-8
" yankできる行数を増やす
set viminfo='20,\"10000

"色指定
" windows terminalの背景色に合わせる
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

colorscheme molokai
syntax on
hi Comment ctermfg=102
hi Visual  ctermbg=245
" volt色付け
autocmd BufNewFile,BufRead *.volt setfiletype htmldjango

" 削除時yamkしない
" nnoremap d "_d
" nnoremap D "_D

""phpdoc
noremap <F4> <Esc>:call PhpDocSingle()<CR>i
nnoremap <F4> :call PhpDocSingle()<CR>
vnoremap <F4> :call PhpDocSingle()<CR>

" deleteを有効
set backspace=indent,eol,start

set expandtab
set tabstop=4
set shiftwidth=4
"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%
" コマンドライン履歴
set history=10000
"Ctags
set tags+=./tags;
" タグジャンプ候補もだす
nnoremap <C-]> g<C-]>
" コロンセミコロンの切り替え
noremap ; :
noremap : ;

" 閉じ括弧のインデントを合わせてくれる
filetype indent on
" 改行時コメントがつかないようにする
" autocmd FileType * setlocal formatoptions-=ro

" 文字列検索
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
" ESCキー2度押しでハイライトの切り替え
nnoremap<F3> :nohlsearch<Esc>

" ----------------------------------------------------------
" スペルチェック
" ----------------------------------------------------------
" :set spell	スペルチェック機能を ON
" :set nospell	スペルチェック機能を OFF
" ]s	次のスペルミスの箇所へ移動
" [s	前のスペルミスの箇所へ移動
" z=	正しいスペルの候補を表示し、選択した単語でスペルミスを修正
" zg	カーソル下の単語を正しいスペルとして辞書登録
" zw	カーソル下の単語を誤ったスペルとして辞書登録
set spell
set spelllang=en,cjk

" ----------------------------------------------------------
"  lightline.vimの設定
" ----------------------------------------------------------
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの位置を表示する

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif


"----------------------------------------------------------
"" CtrlPの設定
"----------------------------------------------------------
""CtrlPの起動 Ctrl+P
"M
""検索モードの切り替え        Ctrl+F
""下方向のカーソル移動        Ctrl+J
""上方向のカーソル移動        Ctrl+K
""検索結果の選択（バッファ）  Enter
""検索結果の選択（水平分割）  Ctrl+X
""CtrlPの終了                 Esc
let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100' "マッチウインドウの設定. 「下部に表示, 大きさ20行で固定, 検索結果100件」
let g:ctrlp_show_hidden = 1 " .(ドット)から始まるファイルも検索対象にする
let g:ctrlp_types = ['fil'] "ファイル検索のみ使用
let g:ctrlp_extensions = ['funky', 'commandline'] "CtrlPの拡張として「funky」と「commandline」を使用

" CtrlPCommandLineの有効化
command! CtrlPCommandLine call ctrlp#init(ctrlp#commandline#id())
" CtrlPFunkyの有効化
let g:ctrlp_funky_matchtype = 'path'
" .gitignoreに書き込まれたファイルを無視するようになる
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
