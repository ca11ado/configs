let mapleader=' '
map <leader>gb :Gblame<CR>
map <leader>gl :0GLog<CR>

"show hidden chars if `listchars` defined
nmap <leader>l :set list!<CR>

nmap <leader>w :Wrap<CR>
command! -nargs=* Wrap set wrap! linebreak!

nmap <leader>gb :Gblame<CR>
nmap <leader>gl :0Glog<CR>
nmap <leader>gd :Gdiff<CR>

"highlight off
nmap <leader>h :noh<CR>

function! ToggleVisualHighlight()
  if !exists('#VisualHighlight#CursorMoved')
    augroup VisualHighlight
      autocmd! * <buffer>
      autocmd CursorMoved <buffer> exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
    augroup END
  else
    augroup VisualHighlight
      autocmd!
      call clearmatches()
    augroup END
  endif
endfunction
:call ToggleVisualHighlight()

"highlight world under cursor in current buffer
nnoremap ,wh :call ToggleVisualHighlight()<CR>
