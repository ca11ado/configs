" Make Vim more useful. This should always be your first configuration line.
set nocompatible

"manual sourcing
execute 'source ~/.vim/modules/ui-mappings.vim'

" Wraps paths to make them relative to this directory.
function! Dot(path)
  return '~/.vim/' . a:path
endfunction

" Load all configuration modules.
for file in split(glob(Dot('modules/*auto.vim')), '\n')
  execute 'source' file
endfor
