
"vim-plug
call plug#begin('~/.vim/plugged')
"vim help japanese
	Plug 'vim-jp/vimdoc-ja'
"swift
	Plug 'apple/swift'
"s>>>>>
	Plug 'kana/vim-submode'
"*search extension
	Plug 'nelstrom/vim-visual-star-search'
call plug#end()

set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
set hlsearch
set tabstop=4 "インデントをスペース4つ分に設定
set smartindent "オートインデント
set expandtab
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻
set incsearch
set history=200
set hidden
set showcmd
set backspace=indent,eol,start

syntax on "コードの色分け

"curor move
noremap i k
noremap j h
noremap k j
noremap h i
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"escape insert mode
inoremap <silent> jj <ESC>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
 
"分割等設
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
