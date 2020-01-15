let g:tex_flavor = "latex"
augroup TeXCmd
    autocmd!
    autocmd BufEnter *.tex  nnoremap <F9> :!ptex2pdf -u -l -ot "-synctex=1 -file-line-error" -output-directory "./sub" % <CR>
    autocmd BufLeave *.tex  nunmap <F9>
augroup END
