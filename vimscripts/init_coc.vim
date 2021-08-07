
nnoremap <silent> <Leader>cl :<C-u>CocList<cr>
nnoremap <silent> <Leader>ch :<C-u>call CocAction('doHover')<cr>
nnoremap <silent> <Leader>cd <Plug>(coc-definition)
nnoremap <silent> <Leader>cr <Plug>(coc-references)
nnoremap <silent> <Leader>cj :<C-u>call CocAction('jumpDefinition')<Cr>

"スペースrnでRename
"nnoremap <silent> <Leader>cn <Plug>(coc-rename)
"スペースfmtでFormat
"nnoremap <silent> <Leader>cf <Plug>(coc-format)
