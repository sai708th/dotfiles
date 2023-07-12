" dein settings {{{
" if dein doen't exit, clone from github
"let g:dein#install_process_timeout = 1000
"let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
"let s:dein_dir = s:cache_home . '/dein_for_vim'
"let s:dein_repo_dir = s:cache_home . '/dein_for_vim.vim'
"if !isdirectory(s:dein_repo_dir)
"	call system('git clone https://github.com/Shougo/dein.vim '.shellescape(s:dein_repo_dir))
"endif
"let &runtimepath = s:dein_repo_dir .",". &runtimepath
"
"" プラグイン読み込み＆キャッシュ作成
"let s:toml_file   = expand("<sfile>:h").'/dein_for_vim.toml'
"let s:toml_file2  = expand("<sfile>:h").'/dein_lazy_for_vim.toml'
"if dein#load_state(s:dein_dir)
"	call dein#begin(s:dein_dir)
"	call dein#load_toml(s:toml_file)
"	call dein#load_toml(s:toml_file2 , { 'lazy' : 1 })
"	call dein#end()
"	call dein#save_state()
"endif
"
"" 不足プラグインの自動インストール
"if has('vim_starting') && dein#check_install()
"	call dein#install()
"endif
"" }}}

"====================================
"   <- dein settings
"------------------------------------
"   other settings ->
"====================================

"---------------------------------------
" その他設定
"---------------------------------------
filetype off
filetype plugin indent off
syntax enable
autocmd FileType * set formatoptions-=ro

"---------------------------------------
" attributes
"---------------------------------------
set number "行番号を表示する
set title "編集中のファイル名を表示
hi MatchParen ctermbg=1
hi Folded ctermbg=185
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
" convenience key mapping
"---------------------------------------
" leader
let mapleader = ' '
noremap <Leader><Leader> o<ESC>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
inoremap <silent> jj <ESC>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"---------------------------------------
" vimfiler
"---------------------------------------
function! s:vimfiler_settings()
	nnoremap <buffer><expr> v vimfiler#do_switch_action('vsplit')
endfunction

augroup vimfiler
	autocmd FileType vimfiler call s:vimfiler_settings()
augroup END

let g:vimfiler_as_default_explorer = 1
nnoremap <Leader>vb :<C-u>VimFilerBufferDir<CR>

 
filetype plugin indent on

