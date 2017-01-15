imap jk <Esc> 
set number
set tabstop=2
set shiftwidth=2
set expandtab "use spaces instead of tabs"
set splitright

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

