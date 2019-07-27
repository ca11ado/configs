set number
set tabstop=2
set shiftwidth=2
set expandtab "use spaces instead of tabs"
set splitright
set wrap
set showtabline=2
"set so=999 "cursor always in the middle of the screen
set so=8
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
"source ~/.vim/modules/vim-set-color.vim

"ESLINT
"source ~/.vim/modules/vim-syntastic.vim

"SEARCH"
set hlsearch "highlight search occurrence"
set nowrapscan "stop recursive search

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

"source ~/.vim/modules/mappings.vim 
