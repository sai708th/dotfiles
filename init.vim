set runtimepath+=$XDG_DATA_HOME/repos/github.com/Shougo/dein.vim

" dein settings {{{
" dein自体の自動インストール
let g:dein#install_process_timeout = 1000
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
		call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
		call dein#begin(s:dein_dir)
		call dein#load_toml(s:toml_file)
		call dein#end()
		call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
		call dein#install()
endif
" }}}

" その他設定
filetype plugin indent on
syntax enable
autocmd FileType * set formatoptions-=ro

" 方向キー
noremap i k
noremap j h
noremap h i
noremap k j

set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
set hlsearch
set tabstop=4 "インデントをスペース4つ分に設定
set shiftwidth=4
set smartindent "オートインデント
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻
set incsearch
set history=200
set hidden
set showcmd
set backspace=indent,eol,start
set scrolloff=4

" cursor line column highlight
au WinLeave * set nocursorline 
au WinEnter * set cursorline 

" leader
let mapleader = ' '

" edit vimrc <F5>
nnoremap <F4> :<C-u>source $MYINITVIM<CR>

" return off lighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" cancel
inoremap <silent> jj <ESC>

" comm mode mapping
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" tatewari
nnoremap <F1> :<C-u>set noscb<CR>:vsp<CR><C-d><C-d>:set scb<CR><C-w>w:set scb<CR><C-w>H

" vimfiler
nnoremap <Leader>vv :<C-u>VimFilerBufferDir<CR>

" Denite key mappings
noremap [Denite] <Nop>
nmap <Leader>d [Denite]
call denite#custom#map('insert',"jj",'<denite:enter_mode:normal>')
call denite#custom#map('normal',"k",'<denite:move_to_next_line>')
call denite#custom#map('normal',"i",'<denite:move_to_previous_line>')
call denite#custom#map('normal',"h",'<denite:enter_mode:insert>')
call denite#custom#map('normal',"j",'<Nop>')
call denite#custom#map('normal'," ",'<Nop>')
" 現在開いているファイルのディレクトリ下のファイル一覧
nnoremap [Denite]f :<C-u>DeniteBufferDir -buffer-name=files file_rec<CR>
" dotfiles
nnoremap [Denite]d :<C-u>Denite -path=~/Dev/dotfiles -mode=normal file_rec<CR>
" バッファ一覧
nnoremap [Denite]b :<C-u>Denite buffer<CR>
" レジスタ一覧
nnoremap [Denite]r :<C-u>Denite -mode=normal -buffer-name=register register<CR>
" ブックマーク(star)一覧,追加
nnoremap [Denite]ss :<C-u>Denite -mode=normal unite:bookmark<CR>
nnoremap [Denite]sa :<C-u>UniteBookmarkAdd<CR>
" 最近使用したファイル一覧
nnoremap [Denite]m :<C-u>Denite -mode=normal -file_mru<CR>
" line
nnoremap [Denite]l :<C-u>Denite line<CR>


" 改行
nnoremap <Leader><Leader> o<ESC>

" 分割等設定
nnoremap s <Nop>
nnoremap sj <C-w>h
nnoremap sk <C-w>j
nnoremap sl <C-w>l
nnoremap si <C-w>k
nnoremap sJ <C-w>H
nnoremap sK <C-w>J
nnoremap sL <C-w>L
nnoremap sI <C-w>K
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>\|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')






