let g:tex_flavor = "latex"

    "autocmd BufEnter *.tex  nnoremap <F9> :!ptex2pdf -u -l -ot "-synctex=1 -file-line-error" -output-directory "./sub" % <CR> font not embedded
    "autocmd BufEnter *.tex  nnoremap <F9> :!ptex2pdf -u -l -ot "-synctex=1 -file-line-error" -od "-f" -output-directory "./sub" % <CR>

augroup TeXCmd
    autocmd!
    autocmd BufEnter *.tex  nnoremap <F9> :call Execute_tex_compile_browser() <CR>
    autocmd BufEnter *.tex  nnoremap <F10> :call Execute_tex_compile() <CR>
    autocmd BufLeave *.tex  nunmap <F9>
    autocmd BufLeave *.tex  nunmap <F10>
augroup END

" index を含むファイル名でコンパイルしてブラウザで開く
function! Execute_tex_compile_browser() abort
    let l:index = system('find **/*index*.tex')
    exec '!ptex2pdf -u -l -ot "-synctex=1 -file-line-error" -od "-f" -output-directory ./sub ' . index
    call system('xdg-open ./sub/' . fnamemodify(index, ':t:r') . '.pdf')
endfunction

" index を含むファイル名でコンパイル
function! Execute_tex_compile() abort
    let l:index = system('find **/*index*.tex')
    exec '!ptex2pdf -u -l -ot "-synctex=1 -file-line-error" -od "-f" -output-directory ./sub ' . index
endfunction
