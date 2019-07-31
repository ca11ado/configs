"vimcasts start
set listchars=tab:▸\ ,eol:¬
"set listchars=tab:▸\ ,eol:·
nmap <leader>l :set list!<CR>

"tabs and spaces
set noexpandtab "spaces instead of tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2

"filetypes and local settings
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

"remove all trailing white spaces
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

"If you want to map this function to a key (e.g. F5), add this:
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
"If you want to run this command automatically when a file is saved, add this:
autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()

"Ans command for deleting white lines :g/^$/d

