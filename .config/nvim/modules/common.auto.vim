"from presentation (90% of plugins)
set nocompatible
filetype plugin on
set path+=**

set number
set tabstop=2
set shiftwidth=2
set expandtab "use spaces instead of tabs"
set splitright
set splitbelow
set nowrap
set showtabline=2
set hidden "allow move from unsaved buffer without error
"set so=999 "cursor always in the middle of the screen
set so=8
set bg=dark
set cursorline

"plugin airline 
"let g:airline#extensions#tabline#left_sep = '> '
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail' 
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 100,
    \ 'x': 150,
    \ 'y': 150,
    \ 'z': 150,
    \ 'warning': 150,
    \ 'error': 50,
    \ }

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -Rf .git/tags --tag-relative --exclude=.git --exclude=pkg --exclude=node_modules --exclude=build --exclude=vendor --exclude=static/django'
" Regexp
let $FZF_DEFAULT_COMMAND = 'Ag -l --nogroup  --nocolor -g ""'
" Literal
"let $FZF_DEFAULT_COMMAND = 'Ag -l --nogroup  --nocolor -Q ""'

"plugin fzf
set rtp+=/usr/local/opt/fzf

"completion for the vim command line by <Tab>
set wildmenu 
set wildmode=longest:full,full

"ctrlp plugin
let g:ctrlp_custom_ignore = '\v[\/]node_modules$'

"netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0

"SEARCH"
set hlsearch "highlight search occurrence"
set nowrapscan "stop recursive search

"searches are case insensitive unless they contain at least one capital letter
set ignorecase
set smartcase

set clipboard=unnamed 

"characters for invisible symbols (use :set list and :set nolist)
set listchars=eol:$,tab:▸·,trail:~,extends:>,precedes:<

"set file status
set laststatus=2

"Snippets plugin :help UltiSnips
let g:UltiSnipsExpandTrigger="\\"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="horizontal"

"Autogenerate Ctags after file save
au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &
