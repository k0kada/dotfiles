" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

filetype off

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" originalrepos on github
" NeoBundle 'Shougo/vimproc', {
"   \ 'build' : {
"     \ 'windows' : 'make -f make_mingw32.mak',
"     \ 'cygwin' : 'make -f make_cygwin.mak',
"     \ 'mac' : 'make -f make_mac.mak',
"     \ 'unix' : 'make -f make_unix.mak',
"   \ },
"   \ }

NeoBundle 'ctrlpvim/ctrlp.vim' " 多機能セレクタ
NeoBundle 'tacahiroy/ctrlp-funky' " CtrlPの拡張プラグイン. 関数検索
NeoBundle 'suy/vim-ctrlp-commandline' " CtrlPの拡張プラグイン. コマンド履歴検索

NeoBundle 'itchyny/lightline.vim' " 情報を下部ラインに表示
NeoBundle 'ujihisa/unite-colorscheme' "カラースキーマ
NeoBundle 'tomasr/molokai'
NeoBundle 'PDV--phpDocumentor-for-Vim'
NeoBundle 'vim-scripts/vim-auto-save' " オートセーブ
NeoBundle 'rhysd/committia.vim' " コミットメッセージ
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'cocopon/vaffle.vim' " vimファイラー

filetype plugin indent on
call neobundle#end()
NeoBundleCheck

let g:auto_save = 1 " オートセーブ有効

set encoding=utf-8
"色指定
colorscheme molokai
hi Comment ctermfg=102
hi Visual  ctermbg=245
" volt色付け
set filetype=htmldjango

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

" 閉じ括弧のインデントを合わせてくれる
filetype indent on
" 改行時コメントがつかないようにする
autocmd FileType * setlocal formatoptions-=ro

" 文字列検索
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
" ESCキー2度押しでハイライトの切り替え
nnoremap<F3> :nohlsearch<Esc>

set visualbell " ビープ音を消す

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
