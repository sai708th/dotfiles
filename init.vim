" dein settings {{{
" if dein doen't exit, clone from github
let g:dein#install_process_timeout = 1000
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:cache_home . '/dein.vim'
if !isdirectory(s:dein_repo_dir)
	call system('git clone https://github.com/Shougo/dein.vim '.shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" プラグイン読み込み＆キャッシュ作成
let s:toml_file   = expand("<sfile>:h").'/dein.toml'
let s:toml_file2  = expand("<sfile>:h").'/dein_lazy.toml'
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	call dein#load_toml(s:toml_file)
	call dein#load_toml(s:toml_file2 , { 'lazy' : 1 })
	call dein#end()
	call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
	call dein#install()
endif
" }}}

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
autocmd FileType * set formatoptions-=ro
syntax enable
colorscheme desert
hi Search ctermfg=white

"---------------------------------------
" some keys, a little change for convenience
"---------------------------------------
nnoremap j gj
nnoremap gj j 
nnoremap k gk
nnoremap gk k 
noremap ; :
noremap : ;

"---------------------------------------
" attributes
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
nnoremap <F1> :<C-u>set noscb<CR>:vsp<CR><C-d><C-d>:set scb<CR><C-w>w:set scb<CR><C-w>H
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
" next, back for comm mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" vv.. -> text block 
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

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
let g:vimfiler_ignore_pattern = '^\%(.git\|.DS_Store\)$'
nnoremap <Leader>vb :<C-u>VimFilerBufferDir<CR>
nnoremap <Leader>vs :<C-u>VimFilerBufferDir -split<CR>

"---------------------------------------
" Denite key mappings
"---------------------------------------
noremap [Denite] <Nop>
nmap <Leader>d [Denite]
call denite#custom#map('insert',"jj",'<denite:enter_mode:normal>')
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
" menu
nnoremap [Denite]j :<C-u>Denite -mode=normal menu<CR>
" プロジェクトディレクトリ
let s:menus = {}
let s:menus.projects = { 'description' : 'projects' }
let s:menus.projects.command_candidates = [['VimFiler ~/Dev/Projects/', 'VimFiler /Users/sai708th/Dev/Projects -split'],['VimFiler OldProjects', 'VimFiler /Users/sai708th/OldProjects -split']]
let s:menus.xcode = { 'description' : 'xcode' }
let s:menus.xcode.command_candidates = [['build', 'new +:Xbuild'],['add source', 'call AddSourceToXcode()']]
let s:menus.qfixhowm = { 'description' : 'QFixHowm' }
let s:menus.qfixhowm.command_candidates = [
\	['diaries', 'normal g,l'],
\	['all files', 'normal g,rA'],
\	['new diary', 'normal g, '],
\	['new memo', 'normal g,c']]
call denite#custom#var('menu', 'menus', s:menus)

"---------------------------------------
" unite settings
"---------------------------------------


"---------------------------------------
" 分割等設定 key mapping s
"---------------------------------------
nnoremap s <Nop>
" cursor move
nnoremap sh <C-w>h  
nnoremap sj <C-w>j  
nnoremap sl <C-w>l  
nnoremap sk <C-w>k  
" window move
nnoremap sH <C-w>H  
nnoremap sJ <C-w>J  
nnoremap sL <C-w>L  
nnoremap sK <C-w>K  
" tab move
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

"---------------------------------------
" Key Mapping g
"---------------------------------------
noremap [gMap] <Nop>
nmap <Leader>g [gMap]
nnoremap [gMap]n :cnext<CR>
nnoremap [gMap]p :cprevious<CR>

