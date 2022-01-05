let g:tex_flavor = "latex"

    "autocmd BufEnter *.tex  nnoremap <F9> :!ptex2pdf -u -l -ot "-synctex=1 -file-line-error" -output-directory "./sub" % <CR> font not embedded
    "autocmd BufEnter *.tex  nnoremap <F9> :!ptex2pdf -u -l -ot "-synctex=1 -file-line-error" -od "-f" -output-directory "./sub" % <CR>

augroup TeXCmd
    autocmd!
    autocmd BufEnter *.tex  nnoremap <F9> :call Execute_tex_compile() <CR>
    autocmd BufLeave *.tex  nunmap <F9>
augroup END

function! Execute_tex_compile() abort
    ":!ptex2pdf -u -l -ot "-synctex=1 -file-line-error" -output-directory "./sub" % <CR> font not embedded
    ":!ptex2pdf -u -l -ot "-synctex=1 -file-line-error" -od "-f" -output-directory "./sub" % <CR>
    exec '!ptex2pdf -u -l -ot "-synctex=1 -file-line-error" -od "-f" -output-directory ./sub ' . expand('%')
    call system('xdg-open ./sub/' . expand('%:t:r') . '.pdf')
endfunction

