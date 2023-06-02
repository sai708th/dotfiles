"=======================================
" 1.  filetype temporary off
" 2.  set attributes
" 3.  Color Scheme
" 4.  autocmd
" 5.  function key mapping
" 6.  convenience key mapping
" 7.  tab open close
" 8.  new command
" 9.  external source
" 99. filetype reset
"=======================================



"---------------------------------------
" 1. filetype temporary off
"---------------------------------------
" turn filetype detection off and, even if it's not strictly
" necessary, disable loading of indent scripts and filetype plugins
filetype off
filetype plugin indent off



"---------------------------------------
" 2. set attributes
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
set signcolumn=yes

set notagbsearch


"---------------------------------------
" 2.5. Color Scheme
"---------------------------------------
let s:vimscripts_dir = $HOME_DOTFILES . '/vimscripts'


"---------------------------------------
" 3. Color Scheme
"---------------------------------------
" check the existence for symbolic link of color scheme
let s:chk = getftype(expand("$VIMRUNTIME/colors/aoidesert.vim"))
if s:chk == "" 
    " if not exist, make symlink to colorscheme in dotfiles
    call system("ln -s ". s:vimscripts_dir ."/aoidesert.vim \"$VIMRUNTIME/colors/aoidesert.vim\"")
endif
colorscheme aoidesert
hi Search ctermfg=white
highlight DiffAdd    ctermfg=white ctermbg=darkblue
highlight DiffDelete ctermfg=brown ctermbg=0
highlight DiffChange ctermfg=gray  ctermbg=brown
highlight DiffText   ctermfg=white ctermbg=brown
highlight IncSearch  ctermfg=3     ctermbg=10



"---------------------------------------
" 4. autocmd
"---------------------------------------
autocmd FileType * set formatoptions-=ro  " 改行で自動コメントアウト停止


"---------------------------------------
" 5. function key mapping
"---------------------------------------
" 1,2        vimgrep next prev
" 3,4        reload 
" 5,6,7,8    fold
nnoremap <F1> :cprevious<CR>
nnoremap <F2> :cnext<CR>
nnoremap <F3> :call neosnippet#variables#set_snippets({})<cr>
nnoremap <F4> :<C-u>source $MYINITVIM<CR>
nnoremap <F5> zM
nnoremap <F6> zm
nnoremap <F7> zr
nnoremap <F8> zR
nnoremap <F9> :set list!<CR>


"---------------------------------------
" 6. convenience key mapping
"---------------------------------------
let mapleader = ' ' " <Leader>
" cancel
inoremap <silent> jj <ESC>
" 改行
noremap <Leader><Leader> o<ESC>
" turn off lighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" next, back for command mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" wrap <--> no wrap
nnoremap - :set invwrap<CR>
" some key change
nnoremap j gj
nnoremap gj j 
nnoremap k gk
nnoremap gk k 
noremap ; :
noremap : ;

nnoremap <C-n> :<C-u>call vista#jump#NextTopLevel()<CR>
nnoremap <C-p> :<C-u>call vista#jump#PrevTopLevel()<CR>


"---------------------------------------
" 7. tab open close
"---------------------------------------
nnoremap <silent> <Leader>to :<C-u>tabedit<cr>
nnoremap <silent> <Leader>tc :<C-u>tabclose<cr>
nnoremap <silent> <Leader>th gT
nnoremap <silent> <Leader>tl gt


"---------------------------------------
" 8. new command
"---------------------------------------
"swift vim
command! -nargs=1 Vimswift vim /<args>/**/*.swift 



"--------------------------------------
" 9. external source
"--------------------------------------
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source `=s:vimscripts_dir . '/ctags.vim'`
source `=s:vimscripts_dir . '/tex.vim'`
source `=s:vimscripts_dir . '/plug.vim'`
"source `=s:vimscripts_dir . '/init_denite.vim'`
source `=s:vimscripts_dir . '/init_deol.vim'`
source `=s:vimscripts_dir . '/init_ddu.vim'`
source `=s:vimscripts_dir . '/init_swift.vim'`
source `=s:vimscripts_dir . '/init_coc.vim'`
source `=s:vimscripts_dir . '/init_vista.vim'`
"source `=s:vimscripts_dir . '/init_gitgutter.vim'`
source `=s:vimscripts_dir . '/init_vimfiler.vim'`
source `=s:vimscripts_dir . '/init_neosnippet.vim'`
source `=s:vimscripts_dir . '/init_separation.vim'` " 分割等の設定 use the plugin 'submode'
source `=s:vimscripts_dir . '/init_others.vim'` 

nnoremap <silent> <Leader>h :<C-u>CocList<cr>


"----------------------------------
" 99. filetype reset
"----------------------------------
" turn filetype detection, indent scripts and filetype plugins on
" and syntax highlighting too
filetype plugin indent on
syntax on





