"MAPPINGS
let mapleader=','
imap jk <Esc>
noremap j gj
noremap k gk
map <leader>w :w<CR>
map <leader><leader> :w<CR>
map <leader>qq :q<CR>
map <leader>qw :x<CR>

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
map <leader>ec :tab sp<CR>

"move to the split in the direction shown, or create a new split
nnoremap <silent> <C-h> <C-W>h
nnoremap <silent> <C-j> <C-W>j
nnoremap <silent> <C-k> <C-W>k
nnoremap <silent> <C-l> <C-W>l

"open split
nnoremap <leader>eh :call WinOpen('h')<cr>
nnoremap <leader>ej :call WinOpen('j')<cr>
nnoremap <leader>ek :call WinOpen('k')<cr>  
nnoremap <leader>el :call WinOpen('l')<cr> 

function! WinOpen(key)
  if (match(a:key,'[jk]'))
    wincmd v
  else
    wincmd s
  endif
endfunction

map <leader>c :%w !LANG=en_US.UTF-8 pbcopy<cr>
"map <leader>b :!browser-sync start --no-notify --no-ui --server --files % > /dev/null 2>&1 &<CR>
map <leader>z <C-z>
"map <leader>l :!clear; and eslint %<CR>

"
nnoremap <space>j 5j
nnoremap <space>k 5k

"move lines around
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv

map <leader>sps :set spell spelllang=ru,en
map <leader>spr :set spell spelllang=ru 
map <leader>spe :set spell spelllang=en 

"nerdtree
map <leader>nn :NERDTreeVCS<CR>
map <leader>nd :NERDTree<CR>
map <leader>nf :NERDTreeFind<CR>
map <leader>nc :NERDTreeToggle<CR>

"sessions
let g:sessions_dir = '~/.vim/sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:sessions_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

"search word in file and show matching count
nnoremap / :%s///ng<Left><Left><Left><Left>
"search exact word
nnoremap <leader>/ :%s/\c\<\>//ng<Left><Left><Left><Left><Left><Left>
"search project files
nnoremap <leader>ff :FZF<cr>
"search project files by lines of code
nnoremap <leader>fl :Lines<cr>
"search project files by tags (requirs ctags to be installed)
nnoremap <leader>ft :Tags<cr>
"search all open files/buffers
nnoremap <leader>fb :Buffers<cr>
"search all files in git index
nnoremap <leader>fg :GFiles<cr>
"search commit in current git log
nnoremap <leader>fc :Commits<cr>
"search commit in current git log
nnoremap <leader>fm :Marks<cr>
"search yanked text (from system register)
nnoremap <leader>fy :Ag! <C-R>0<CR>
"find word from (internal register)
nnoremap <leader>fr :%s/<C-r>*//ng<CR>

"search word under cursor and move downwardsssssssssssssssssssss
nnoremap <leader>.. *:
"search word under cursor and move upwards
nnoremap <leader>.<leader> *NN

"start a search query by pressing \
nnoremap \  :Ag!<space>
"search for word under cursor by pressing |
nnoremap \| :Ag! <C-R><C-W><cr>
"if using Ag! it will be opened in full screen with preview
command! -bang -complete=dir -nargs=* Ag
  \ call fzf#vim#ag_raw(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
"pass directory argument to Ag command
"command! -bang -nargs=+ -complete=dir Ag call fzf#vim#ag_raw(<q-args>, <bang>0)
"enable preview for marks
command! -bang Marks
  \ call fzf#vim#marks({'options': ['--preview', 'echo line = {}']})

"replace the word under cursor
nnoremap <leader>rc :%s/\<<c-r><c-w>\>//gc<left><left><left>
"replace the word from register
nnoremap <leader>ry :%s/<c-r>0/<c-r>0/gc<left><left><left>
"reptace current word under cursor
nnoremap <leader>rw ebye:%s/\<<c-r>0\>/<c-r>0/gc<left><left><left>

set tags+=.git/tags
nnoremap <leader>ct :!ctags -Rf .git/tags --tag-relative --exclude=.git --exclude=pkg --exclude=node_modules --exclude=build --exclude=vendor --exclude=static/django<cr><cr>

"Tab to switch to next open argument
"nnoremap <Tab> :bn<cr>
nnoremap <leader>tn :bn<CR>
"Shift + Tab to switch to previous open argument
nnoremap <leader>tp :bp<CR>
"nnoremap <S-Tab> :bp<cr>
"nnoremap <leader><Tab> <c-^>

"leader key twice to cycle between last two open buffers or arguments
nnoremap <leader><SPACE> <c-^>
"switch to the next buffer
nnoremap <leader>bn :n<cr>
"switch to the previous buffer
nnoremap <leader>bp :p<cr>


"command mode
cmap <C-p> <Up>
cmap <C-n> <Down>

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <silent> <leader>rr1 :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>rr2 :exe "resize " . (winheight(0) * 1/3)<CR>
nnoremap <leader>rr= <C-w>=

nmap <silent> <leader>sk <Plug>(ale_previous_wrap)
nmap <silent> <leader>sj <Plug>(ale_next_wrap)

"select pasted text (https://vim.fandom.com/wiki/Selecting_your_pasted_text)
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

"Consistently direction of n/N characters
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

"remove space symbol and add new line
nnoremap <leader>a<space> xi<CR><ESC>

"JAVASCRIPT
map ,dc :g/console.log/d<cr>

"Populate args with filenames from commit
nnoremap <leader>af :argadd `Git diff-tree -r --no-commit-id --name-only `<left> 
