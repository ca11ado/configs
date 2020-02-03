" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

let mapleader=','
nnoremap <leader>al :ALELint<cr>
