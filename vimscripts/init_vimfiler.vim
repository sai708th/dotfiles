augroup vimfiler
    autocmd FileType vimfiler nnoremap <buffer><expr> v vimfiler#do_switch_action('vsplit')
augroup END
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = '^\%(.git\|.DS_Store\)$'
nnoremap <Leader>vb :<C-u>VimFilerBufferDir -auto-cd <CR>
nnoremap <Leader>ve :<C-u>VimFilerBufferDir -explorer<CR>
