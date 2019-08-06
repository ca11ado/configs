"MAPPINGS
let mapleader=','
imap jk <Esc>
noremap j gj
noremap k gk
map <leader>w :w<CR>
map <leader>qq :q<CR>
map <leader>qw :x<CR>
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ec :tab sp<CR>

"show hidden chars if `listchars` defined
nmap <leader>l :set list!<CR>

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

"sessions
let g:sessions_dir = '~/.vim/sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:sessions_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

"search word in file and show matching count
nnoremap / :%s///ng<Left><Left><Left><Left>
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
"search yanked text (from register)
nnoremap <leader>fy :Ag! <C-R>0<CR>
"find word or use last searched and replace with clipboard
nnoremap ,fr :%s//<C-r>*/gc<C-b><right><right><right>

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
nnoremap <leader>rc :%s/\<<c-r><c-w>\>//gc<left><left>
"replace the word from register
nnoremap <leader>ry :%s/<c-r>0//gc<left><left><left>

set tags+=.git/tags
nnoremap <leader>ct :!ctags -Rf .git/tags --tag-relative --exclude=.git --exclude=pkg --exclude=node_modules --exclude=build --exclude=vendor<cr><cr>

"Tab to switch to next open argument
nnoremap <Tab> :next<cr>
"Shift + Tab to switch to previous open argument
nnoremap <S-Tab> :previous<cr>
nnoremap <leader><Tab> :previous<cr>
"leader key twice to cycle between last two open buffers or arguments
nnoremap <leader><SPACE> <c-^>
"switch to the next buffer
nnoremap <leader>bn :n<cr>
"switch to the previous buffer
nnoremap <leader>:bp :p<cr>


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
