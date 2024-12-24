"> in md files '\,' to update ordered lists
    function UpdateOrderedList()
        let c=0|g/^\d\+\ze\./let c+=1|s//\=c
    endfunction
    autocmd Filetype md,markdown inoremap \, <esc>:call UpdateOrderedList()<cr>:startinsert<cr>
    autocmd Filetype md,markdown nnoremap \, :call UpdateOrderedList()<cr>:startinsert<cr>
"> in md file, 'ctrl+enter' to insert new item in ordedered and unordered lists
    function! ContinueMarkdownList()
        let l:line = getline('.')
        if l:line =~ '^\s*[-+]\s\+'
            return "\<cr>- "
        elseif l:line =~ '^\s*[*+]\s\+'
            return "\<cr>* "
        elseif l:line =~ '^\s*\d\+\.\s\+'
            let l:prefix = matchstr(l:line, '^\s*\zs\d\+\ze\.\s\+')
            let l:number = str2nr(l:prefix) + 1
            return "\<cr>" . l:number . ". "
        else
            return "\<cr>"
        endif
    endfunction 
    autocmd Filetype md,markdown inoremap <expr> <c-cr> ContinueMarkdownList()
