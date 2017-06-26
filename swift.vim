"---------------------------------------
" Functions
"---------------------------------------
" variable ha local to no kubetsu dekinai
" g/\%(for *\)\@<!var.*{$/

" function no def wo atsumeru
function! CollectFunction4Swift()
	let ovrds = ''
	let funcs = ''

	" gather lines each of which includes 'init'
	let tmps = ''
	g/init/ let tmps .= getline('.') . "\n"
	let tmps = split(tmps,'\n')
	" cut head space, last '{'
	for aInit in tmps
		let funcs .= matchstr(aInit, ' *\zs[^{]*') . "\n"
	endfor
	
	" gather lines each of which includes 'func'
	let tmps = ''
	g/func/ let tmps .= getline('.') . "\n"
	let tmps = split(tmps,'\n')
	" cut head space, last '{'
	" if lines include 'override', add it ovrds, otherwise funcs
	for aFunc in tmps
		let aFunc = matchstr(aFunc, ' *\zs[^{]*')
		if aFunc =~ 'override' 
			let ovrds .= aFunc . "\n"
		else
			let funcs .= aFunc . "\n"
		endif
	endfor

	" edit whole lines
	let defs = ''
	if ovrds != ''
		let defs .= '#### overrides' . "\n"
		let defs .= ovrds
	endif
	if funcs != ''
		let defs .= '#### methods' . "\n"
		let defs .= funcs
	endif 

	let @q = defs
endfunction

" mojiretsu wo atsumeru
function! CollectString4Swift()
	let tmps = ''
	g/"/ let tmps .= getline('.') . "\n"
	let tmps = split(tmps,'\n')
	
	let strs = ''
	for aStr in tmps
		let strs .= matchstr(aStr, '".*"') . "\n"
	endfor
	let @q = strs
endfunction




