
" deol
" execute 'Deol' '-cwd='.('%'->expand()->fnamemodify(':h'))
nnoremap <C-z> :<C-u>Deol<CR>
"nnoremap [Denite]e :<C-u>DeolEdit<CR>
tnoremap <C-z> <C-\><C-n>
let g:deol#custom_map = {
    \ 'start_insert': 'i',
    \ 'start_insert_first': 'I',
    \ 'start_append': 'a',
    \ 'start_append_last': 'A',
    \ 'execute_line': '<CR>',
    \ 'previous_prompt': '<C-p>',
    \ 'next_prompt': '<C-n>',
    \ 'paste_prompt': 'jj',
    \ 'bg': '<q>',
    \ }

augroup DeolCtrlZ
    autocmd!
    autocmd filetype deol nnoremap <buffer> <C-z> <C-o>
augroup END


