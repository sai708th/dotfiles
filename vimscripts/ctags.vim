set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis

augroup ctags
  autocmd!
  autocmd BufWritePost * GenCtags
augroup END
