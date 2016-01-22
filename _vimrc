set number "行番号を表示する

set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
set hlsearch
set tabstop=4 "インデントをスペース4つ分に設定
set smartindent "オートインデント
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻
set incsearch

syntax on "コードの色分け

"curor move
noremap i k
noremap j h
noremap k j
noremap h i
noremap <return> o<esc>

"escape insert mode
inoremap <silent> jj <esc>

"行頭、行末に移動
nnoremap 0 $
nnoremap 1 0

"括弧の設定
inoremap { {}<left>
inoremap [ []<left>
inoremap ( ()<left>
inoremap " ""<left>
inoremap ' ''<left>
inoremap <> <><left>
