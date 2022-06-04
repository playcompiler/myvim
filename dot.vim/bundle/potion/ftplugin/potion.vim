"potion vimscript
"
"fold settings
setlocal foldmethod=expr
setlocal foldexpr=GetPotionFold(v:lnum)
"setlocal foldignore=

"open the fold of next line
func! GetPotionFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif
    let this_indent = IndentLeval(a:lnum)
    let next_indent = IndentLeval(NextNonBlankLine(a:lnum))
    if next_indent == this_indent
        return this_indent
    elseif next_indent < this_indent
        return this_indent
    elseif next_indent > this_indent
        return '>' . next_indent
    endif
endfunc

"get indent level
func! IndentLeval(lnum)
    return indent(a:lnum) / &shiftwidth
endfunc

"get next line number
function! NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1
    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif
        let current += 1
    endwhile
    return -2
endfunction

"compile and run potion file
if !exists("g:potion_command")
    let g:potion_command = "/root/scripts/potion"
endif

function! PotionCompileAndRunFile()
    silent !clear
    execute "!" . g:potion_command . " " . bufname("%")
endfunction

"compile and dump bytecode
function! PotionShowBytecode()
    " Get the bytecode.
    let bytecode = system(g:potion_command . " -c -V " . bufname("%") . " 2>&1")
    " Open a new split and set it up.
    vsplit __Potion_Bytecode__
    normal! ggdG
    setlocal filetype=potionbytecode
    setlocal buftype=nofile
    " Insert the bytecode.
    call append(0, split(bytecode, '\v\n'))
endfunction

nnoremap <buffer> <leader>r :call PotionCompileAndRunFile()<cr>
nnoremap <buffer> <leader>b :call PotionShowBytecode()<cr>

