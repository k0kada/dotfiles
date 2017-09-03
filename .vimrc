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
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
NeoBundle 'itchyny/lightline.vim' " 情報を下部ラインに表示
NeoBundle 'ujihisa/unite-colorscheme' "カラースキーマ
NeoBundle 'tomasr/molokai'
NeoBundle 'PDV--phpDocumentor-for-Vim'
NeoBundle 'vim-scripts/vim-auto-save' " オートセーブ
NeoBundle 'rhysd/committia.vim' " コミットメッセージ

filetype plugin indent on
call neobundle#end()
NeoBundleCheck


" F3でtig blame
nnoremap <F3> :silent! !tig blame +<C-r>=line('.')<CR> %<CR>:redraw!<CR>

let g:auto_save = 1 " オートセーブ有効

"色指定
colorscheme molokai
syntax on


""phpdoc
noremap <C-P> <Esc>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocSingle()<CR>

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
