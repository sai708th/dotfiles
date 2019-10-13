"---------------------------------------
" Denite key mappings
"---------------------------------------
noremap [Denite] <Nop>
nmap <Leader>d [Denite]
call denite#custom#map('insert',"jj",'<denite:enter_mode:normal>')
call denite#custom#map('normal'," ",'<Nop>')
" dotfiles
nnoremap [Denite]d :<C-u>Denite -path=~/Dev/dotfiles -mode=normal file_rec<CR>
" バッファ一覧
nnoremap [Denite]b :<C-u>Denite buffer<CR>
" レジスタ一覧
" nnoremap [Denite]r :<C-u>Denite -mode=normal -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap [Denite]f :<C-u>Denite file_old<CR>
nnoremap [Denite]o :<C-u>Denite outline<CR>
