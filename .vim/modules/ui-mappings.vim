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

"only one shown buffer
nnoremap <leader>o <C-W>o

" diff highlight off/on (todo :windo diffthis)
nmap <leader>hd :diffoff

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


