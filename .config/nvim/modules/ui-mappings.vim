let mapleader=' '
"
"show hidden chars if `listchars` defined
nmap <leader>l :set list!<CR>

nmap <leader>w :Wrap<CR>
command! -nargs=* Wrap set wrap! linebreak!

"only one shown buffer
nnoremap <leader>o <C-W>o

"search highlight off
nmap <leader>hs :noh<CR>
"highlight world under cursor in current buffer
nnoremap <leader>hw :call ToggleVisualHighlight()<CR>

augroup VisualHighlight
  autocmd!
augroup END


let blacklist = ['']
function! ToggleVisualHighlight()
  if !exists('#VisualHighlight#CursorMoved')
    augroup VisualHighlight
      autocmd!
      autocmd CursorMoved * if index(blacklist, &ft) < 0 | exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
    augroup END
  else
    augroup VisualHighlight
      autocmd!
      call clearmatches()
    augroup END
  endif
endfunction

":call ToggleVisualHighlight()


