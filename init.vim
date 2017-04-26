" dein settings {{{
" if dein doen't exit, clone from github
let g:dein#install_process_timeout = 1000
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
		call system('git clone https://github.com/Shougo/dein.vim '.shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" プラグイン読み込み＆キャッシュ作成
let s:toml_file   = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:toml_file2  = fnamemodify(expand('<sfile>'), ':h').'/dein_lazy.toml'
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
filetype plugin indent on
syntax enable
autocmd FileType * set formatoptions-=ro
autocmd BufNewFile,BufRead *.swift set filetype=swift

"---------------------------------------
" some keys, a little change for convenience
"---------------------------------------
noremap j gj
noremap gj j 
noremap k gk
noremap gk k 
noremap ; :
noremap : ;

"---------------------------------------
" attributes
"---------------------------------------
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
hi MatchParen ctermbg=1
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
set splitbelow

"---------------------------------------
" function key mapping
"---------------------------------------
" tatewari
nnoremap <F1> :<C-u>set noscb<CR>:vsp<CR><C-d><C-d>:set scb<CR><C-w>w:set scb<CR><C-w>H
" edit vimrc <F5>
nnoremap <F4> :<C-u>source $MYINITVIM<CR>

"---------------------------------------
" convenience key mapping
"---------------------------------------
" leader
let mapleader = ' '
" cancel
inoremap <silent> jj <ESC>
" 改行
noremap <Leader><Leader> o<ESC>
" return off lighting
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
nnoremap <Leader>vb :<C-u>VimFilerBufferDir<CR>
nnoremap <Leader>vs :<C-u>VimFilerBufferDir -split<CR>

"---------------------------------------
" Denite key mappings
"---------------------------------------
noremap [Denite] <Nop>
nmap <Leader>d [Denite]
call denite#custom#map('insert',"jj",'<denite:enter_mode:normal>')
"call denite#custom#map('normal',"k",'<denite:move_to_next_line>')
"call denite#custom#map('normal',"i",'<denite:move_to_previous_line>')
"call denite#custom#map('normal',"h",'<denite:enter_mode:insert>')
"call denite#custom#map('normal',"j",'<Nop>')
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
call denite#custom#var('menu', 'menus', s:menus)

"---------------------------------------
" unite settings
"---------------------------------------


"---------------------------------------
" mapping for completing
"---------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:neosnippet#snippets_directory = expand('~/Dev/snippets/')
" Plugin key-mappings.
" SuperTab like snippets behavior.
nmap <expr><C-k> neosnippet#expandable_or_jumpable() ?
\	"i\<Plug>(neosnippet_expand_or_jump)" : "\<Nop>"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


"---------------------------------------
" 分割等設定
"---------------------------------------
nnoremap s <Nop>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sl <C-w>l
nnoremap sk <C-w>k
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sL <C-w>L
nnoremap sK <C-w>K
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
" Functions
"---------------------------------------
" for Xcode, make source, add to Xcode
function! AddSourceToXcode()
	let name = fnamemodify(expand("%:p"), ":t")
	let projectpath = glob(expand("%:h") . '/../*.xcodeproj')
	call system('ruby ~/Dev/RubyScripts/xcodeprojeditor.rb ' . projectpath . ' ' . name)
endfunction















