nmap <C-k> <Plug>(neosnippet_jump)
imap <C-k> <Plug>(neosnippet_jump_or_expand)
smap <C-k> <Plug>(neosnippet_jump_or_expand)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory = expand('~/Dev/dotfiles/snippets/')
autocmd BufRead,BufNewFile *.snip setlocal noexpandtab list
