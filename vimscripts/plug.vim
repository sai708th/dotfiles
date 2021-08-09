
call plug#begin()
    Plug 'Shougo/unite.vim'
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/neomru.vim'
    Plug 'Shougo/vimfiler.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/deol.nvim'

    Plug 'vim-jp/vimdoc-ja'

    Plug 'terryma/vim-expand-region'

    Plug 'jsfaint/gen_tags.vim'

    " git
    Plug 'tpope/vim-fugitive'
    Plug 'cohama/agit.vim'
    " Plug 'airblade/vim-gitgutter'
    Plug 'kana/vim-submode'

    " swift
    " syntax
    Plug 'apple/swift'
    Plug 'keith/swift.vim' 

    " autocomplete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"#-------------------
"# swift
"#-------------------
"#
"#[[plugins]]
"#repo = 'gfontenot/vim-xcode'
"#on_ft = ['swift']
"#
