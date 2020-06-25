let s:vimscripts_dir = $HOME_DOTFILES . '/vimscripts'

" dein initialization
source `=s:vimscripts_dir . '/init_dein.vim'`

"---------------------------------------
" Basic settings
"---------------------------------------
filetype off
filetype plugin indent off
autocmd FileType * set formatoptions-=ro
syntax enable
colorscheme desert
hi Search ctermfg=white

"---------------------------------------
" set attributes
"---------------------------------------
set number "行番号を表示する
set title "編集中のファイル名を表示
set hlsearch
set tabstop=4 "インデントをスペース4つ分に設定
set softtabstop=4 "delete space width
set shiftwidth=4
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
set scrolloff=4
set splitbelow
set foldmethod=indent "おりたたみ:indent
set synmaxcol=200 
set noswapfile
set clipboard=unnamed
set listchars=tab:»-,trail:-,nbsp:%

"---------------------------------------
" function key mapping
"---------------------------------------
" tatewari
" nnoremap <F1> :<C-u>set noscb<CR>:vsp<CR><C-d><C-d>:set scb<CR><C-w>w:set scb<CR><C-w>H
" vimgrep next prev
nnoremap <F1> :cprevious<CR>
nnoremap <F2> :cnext<CR>
" reload 
nnoremap <F3> :call neosnippet#variables#set_snippets({})<cr>
nnoremap <F4> :<C-u>source $MYINITVIM<CR>
" edit vimrc 
nnoremap <F5> zM
nnoremap <F6> zm
nnoremap <F7> zr
nnoremap <F8> zR

"---------------------------------------
" convenience key mapping
"---------------------------------------
" leader
let mapleader = ' '
" cancel
inoremap <silent> jj <ESC>
" 改行
noremap <Leader><Leader> o<ESC>
" turn off lighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" next, back for command mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" vv.. -> text block 
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" wrap <--> no wrap
nnoremap - :set invwrap<CR>
" some key change
nnoremap j gj
nnoremap gj j 
nnoremap k gk
nnoremap gk k 
noremap ; :
noremap : ;

"---------------------------------------
" new command
"---------------------------------------
"swift vim
command! -nargs=1 Vimswift vim /<args>/**/*.swift 

"---------------------------------------
" vimfiler
"---------------------------------------
augroup vimfiler
    autocmd FileType vimfiler nnoremap <buffer><expr> v vimfiler#do_switch_action('vsplit')
augroup END
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = '^\%(.git\|.DS_Store\)$'
nnoremap <Leader>vb :<C-u>VimFilerBufferDir -auto-cd <CR>
nnoremap <Leader>ve :<C-u>VimFilerBufferDir -explorer<CR>

"---------------------------------------
" Denite key mappings
"---------------------------------------
source `=s:vimscripts_dir . '/init_denite.vim'`

"---------------------------------------
" 分割等設定 key mapping s
"---------------------------------------
source `=s:vimscripts_dir . '/init_separation.vim'`

"--------------------------------------
" other source
"--------------------------------------
source `=s:vimscripts_dir . '/init_swift.vim'`
source `=s:vimscripts_dir . '/ctags.vim'`
source `=s:vimscripts_dir . '/tex.vim'`

"----------------------------------
" filetype reset
"----------------------------------
filetype plugin indent on

