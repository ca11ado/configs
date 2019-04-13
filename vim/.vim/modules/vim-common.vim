imap jk <Esc> 
set number
set tabstop=2
set shiftwidth=2
set expandtab "use spaces instead of tabs"
set splitright

"netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0

"COLORS
source ~/.vim/modules/vim-set-color.vim

"SEARCH"
set hlsearch "highlight search occurrence"
set ignorecase "ignore words case in search"

set clipboard=unnamed 

"set current directory for opened buffer
"set autochdir

"characters for invisible symbols (use :set list and :set nolist)
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"set file status
set laststatus=2

"MAPPGINS
let mapleader=','
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

map <C-l> <C-W><Right>
map <C-h> <C-W><Left>
map <C-k> <C-W><Up>
map <C-j> <C-W><Down>

map ,c :%w !pbcopy<cr>
map ,b :!browser-sync start --no-notify --no-ui --server --files % > /dev/null 2>&1 &<CR>
