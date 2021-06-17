" This is the main plugin list, sourced by modules/plugins.vim
" " Configuration goes in the appropriate modules/plugins/*.vim file.
" " So configuration for tmux.vim would go in modules/plugins/tmux.vim.vim

"Plug 'Lokaltog/vim-easymotion'

" automatic closing of quotes, parenthesis, brackets, etc
Plug 'Raimondi/delimitMate'
" Plug 'jiangmiao/auto-pairs'

" autocompletion
" Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" indicate added, modified and removed lines in a file 
Plug 'mhinz/vim-signify'

" provides syntax highlighting and improved indentation
" Plug 'pangloss/vim-javascript'

" typescript and react syntax highlight https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'

" Vim syntax highlighting
" Plug 'posva/vim-vue'

" color schemes
Plug 'dracula/vim', { 'as': 'dracula' }

" vcs
Plug 'tpope/vim-fugitive'

" file manager
Plug 'scrooloose/nerdtree'

" search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" highlights the XML/HTML tags that enclose your cursor location
Plug 'valloric/matchtagalways'

" eslint
Plug 'dense-analysis/ale'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'

"Snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

"Cheat.sh
Plug 'dbeniamine/cheat.sh-vim'

"discord
" Plug 'hugolgst/vimsence'
