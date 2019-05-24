set number
set tabstop=2
set shiftwidth=2
set expandtab "use spaces instead of tabs"
set splitright
set wrap
set showtabline=2
"set so=999 "cursor always in the middle of the screen

"Автоматическое переключение на русскую расскладку
"let g:XkbSwitchEnabled = 1
"let g:XkbSwitchIMappings = ['ru']
"let g:XkbSwitchLib = '/usr/local/lib/libxkbswitch.dylib'
"set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

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
set ignorecase "ignore words case in search"

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

map <C-l> <C-W><Right>
map <C-h> <C-W><Left>
map <C-k> <C-W><Up>
map <C-j> <C-W><Down>

map <leader>c :%w !pbcopy<cr>
map <leader>z <C-z>
map <leader>l :!clear; and eslint %<CR>

map <leader>ff :CtrlPRoot<CR>
map <leader>fn :Ack --ignore-dir=node_modules --ignore-dir=.git --ignore-dir=.idea ""<Left>
map <leader>fj :Ack --ignore-dir=node_modules --ignore-dir=.git --ignore-dir=.idea "" ./static/src/<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
map <leader>ft :Ack --ignore-dir=node_modules --ignore-dir=.git --ignore-dir=.idea "" ./templates/<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

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

"command mode
cmap <C-p> <Up>
cmap <C-n> <Down>
