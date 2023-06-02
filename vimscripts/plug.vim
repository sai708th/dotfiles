
call plug#begin()
    " needs for vimfiler
    Plug 'Shougo/unite.vim' 
    " Plug 'Shougo/denite.nvim'
    " Plug 'Shougo/neomru.vim'
    Plug 'Shougo/vimfiler.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/deol.nvim'

    " ddu
    Plug 'vim-denops/denops.vim'
    Plug 'Shougo/ddu.vim'
    Plug 'Shougo/ddu-ui-ff'
    Plug 'Shougo/ddu-source-file'
    Plug 'Shougo/ddu-source-register'
    Plug 'kuuote/ddu-source-mr'
    Plug 'shun/ddu-source-rg'
    Plug 'lambdalisue/mr.vim'
    Plug 'shun/ddu-source-buffer'
    Plug 'Shougo/ddu-filter-matcher_substring'
    Plug 'Shougo/ddu-commands.vim'
    Plug 'Shougo/ddu-kind-file'
    Plug 'Shougo/unite-outline'
    Plug 'Shougo/ddu-source-line'

    Plug 'vim-jp/vimdoc-ja'
    Plug 'terryma/vim-expand-region'
    Plug 'jsfaint/gen_tags.vim'

    " git
    Plug 'tpope/vim-fugitive'
    Plug 'cohama/agit.vim'
    " Plug 'airblade/vim-gitgutter'
    Plug 'kana/vim-submode'

    " swift, syntax
    Plug 'apple/swift'
    Plug 'keith/swift.vim' 

    " tag viewer like ide
    Plug 'liuchengxu/vista.vim'

    " autocomplete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " move plugin
    Plug 'skanehira/jumpcursor.vim'
call plug#end()


