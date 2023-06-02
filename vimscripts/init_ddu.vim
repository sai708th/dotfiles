
" global settings
call ddu#custom#patch_global({
    \   'ui': 'ff',
    \   'sources': [{'name': 'file_rec', 'params': {}}],
    \   'sourceOptions': {
    \     '_': {
    \       'matchers': ['matcher_substring'],
    \     },
    \   },
    \   'kindOptions': {
    \     'file': {
    \       'defaultAction': 'open',
    \     },
    \     'custom-list': {
    \       'defaultAction': 'callback',
    \     },
    \   },
    \   'sourceParams' : {
    \     'rg' : {
    \       'args': ['--ignore-case', '--json', '--column', '--no-heading', '--color', 'never'],
    \     },
    \   }
    \ })

"call ddu#custom#patch_local('grep', {
"\   'sourceParams' : {
"\     'rg' : {
"\       'args': ['--ignore-case', '--json', '--column', '--no-heading', '--color', 'never'],
"\     },
"\   },
"\   'uiParams': {
"\     'ff': {
"\       'startFilter': v:false,
"\     }
"\   },
"\ })

" key mapping for fzf
autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
    nnoremap <buffer><silent> <CR>
                \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
    nnoremap <buffer><silent> <Space>
                \ <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
    nnoremap <buffer><silent> i
                \ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
    nnoremap <buffer><silent> q
                \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

" key mapping for fzf-filter
autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
    inoremap <buffer><silent> <CR>
                \ <Esc><Cmd>close<CR>
    nnoremap <buffer><silent> <CR>
                \ <Cmd>close<CR>
    nnoremap <buffer><silent> q
                \ <Cmd>close<CR>
endfunction
"ddu keymapping.
nnoremap <SID>[ddu]  <Nop>
nmap     <Leader>d  <SID>[ddu]

nnoremap <silent> <SID>[ddu]d :<C-u>Ddu file -source-option-path='`expand('~/Dev/dotfiles')`'<CR>
nnoremap <silent> <SID>[ddu]m :<C-u>Ddu file -source-option-path='`expand('~/Dev/Projects/MyLibrary/privatememos')`'<CR>
nnoremap <silent> <SID>[ddu]j :<C-u>Ddu mr<CR>
nnoremap <silent> <SID>[ddu]r :<C-u>Ddu mr -source-param-kind='mrr'<CR>
nnoremap <silent> <SID>[ddu]b :<C-u>Ddu buffer<CR>
nnoremap <silent> <SID>[ddu]g :<C-u>DduRg<CR>
nnoremap <silent> <SID>[ddu]G :<C-u>Ddu rg -source-param-input='`expand('<cword>')`'<CR>
nnoremap <silent> <SID>[ddu]o :<C-u>Vista!!<CR>
nnoremap <silent> <SID>[ddu]s :<C-u>NeoSnippetEdit<CR>
nnoremap <silent> <SID>[ddu]i :<C-u>Ddu rg -source-param-input='^nnoremap.*silent.*ddu' -source-param-path='`expand('~/Dev/dotfiles')`'<CR>

"nnoremap <silent> <SID>[ddu]r :<C-u>Ddu register<CR>
"nnoremap <silent> <SID>[ddu]n :<C-u>Ddu file -source-param-new -volatile<CR>
"nnoremap <silent> <SID>[ddu]f :<C-u>Ddu file<CR>
"nmap <silent> <SID>[ddu]g <Cmd>call ddu#start({
"\   'name': 'grep',
"\   'sources':[
"\     {'name': 'rg', 'params': {'input': expand('<cword>')}}
"\   ],
"\ })<CR>
"
"
"

