"---------------------------------------
" Denite key mappings
"---------------------------------------
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
                \ denite#do_map('toggle_select').'j'
endfunction

noremap [Denite] <Nop>
nmap <Leader>d [Denite]
call denite#custom#map('insert',"jj",'<denite:enter_mode:normal>')
call denite#custom#map('normal'," ",'<Nop>')
" dotfiles
nnoremap [Denite]d :<C-u>Denite file -path=~/Dev/dotfiles <CR>
" cheatsheets 
nnoremap [Denite]c :<C-u>Denite file -path=~/Dev/dotfiles/cheatsheet -sorters=sorter/word<CR>
" バッファ一覧
nnoremap [Denite]b :<C-u>Denite buffer<CR>
" レジスタ一覧
" nnoremap [Denite]r :<C-u>Denite -mode=normal -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap [Denite]f :<C-u>Denite file_old<CR>
nnoremap [Denite]o :<C-u>Denite outline<CR>

" deol
nnoremap [Denite]s :<C-u>Deol<CR>
"nnoremap [Denite]e :<C-u>DeolEdit<CR>
tnoremap <ESC> <C-\><C-n>
let g:deol#custom_map = {
    \ 'edit': 'e',
    \ 'start_insert': 'i',
    \ 'start_insert_first': 'I',
    \ 'start_append': 'a',
    \ 'start_append_last': 'A',
    \ 'execute_line': '<CR>',
    \ 'previous_prompt': '<C-p>',
    \ 'next_prompt': '<C-n>',
    \ 'paste_prompt': '<C-y>',
    \ 'bg': '<C-z>',
    \ 'quit': 'q',
    \ }







