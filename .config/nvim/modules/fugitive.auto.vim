noremap ,gs :Gstatus<CR>
noremap ,gb :Gblame<CR>
noremap ,gdc :Gdiff<CR>
noremap ,gdd :Gdiff origin/develop<CR>

" git log global
noremap ,gll :Git log<CR>
" git log for current file
noremap ,glc :Git log -- %<CR>
