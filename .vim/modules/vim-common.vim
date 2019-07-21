set number
set tabstop=2
set shiftwidth=2
set expandtab "use spaces instead of tabs"
set splitright
set wrap
set showtabline=2
"set so=999 "cursor always in the middle of the screen
set bg=dark
set cursorline

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -Rf .git/tags --tag-relative --exclude=.git --exclude=pkg --exclude=node_modules --exclude=build --exclude=vendor'

"taboo plugin for formating tabs names
set sessionoptions+=tabpages,globals
let g:taboo_tab_format = " <%P>: %f"

"fzf
set rtp+=/usr/local/opt/fzf

"completion for the vim command line by <Tab>
set wildmenu 
set wildmode=longest:full,full

"ctrlp plugin
let g:ctrlp_custom_ignore = '\v[\/]node_modules$'

"netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0

"COLORS
source ~/.vim/modules/vim-set-color.vim

"ESLINT
"source ~/.vim/modules/vim-syntastic.vim

"SEARCH"
set hlsearch "highlight search occurrence"

"searches are case insensitive unless they contain at least one capital letter
set ignorecase
set smartcase

set clipboard=unnamed 

"set current directory for opened buffer
"set autochdir

"characters for invisible symbols (use :set list and :set nolist)
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"set file status
set laststatus=2

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

"move to the split in the direction shown, or create a new split
nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
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

"start a search query by pressing \
nnoremap \  :Ag!<space>
"search for word under cursor by pressing |
nnoremap \| :Ag! <C-R><C-W><cr>
"if using Ag! it will be opened in full screen with preview
command! -bang -nargs=* Ag
  \ call fzf#vim#ag_raw(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
"pass directory argument to Ag command
"command! -bang -nargs=+ -complete=dir Ag call fzf#vim#ag_raw(<q-args>, <bang>0)

"replace the word under cursor
nnoremap <leader>fr :%s/\<<c-r><c-w>\>//g<left><left>

set tags+=.git/tags
nnoremap <leader>ct :!ctags -Rf .git/tags --tag-relative --exclude=.git --exclude=pkg --exclude=node_modules --exclude=build --exclude=vendor<cr><cr>

"Tab to switch to next open buffer
nnoremap <Tab> :bnext<cr>
"Shift + Tab to switch to previous open buffer
nnoremap <S-Tab> :bprevious<cr>
"leader key twice to cycle between last two open buffers
nnoremap <leader><SPACE> <c-^>

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

