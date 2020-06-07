let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeHighlightCursorline = 1

" nerdtree file highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree silent highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree silent syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('rb', 'Magenta', 'none', '#F56C6C', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', '#12D900', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#f0db4f', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', '#8EE635', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', '#94ED8C', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', '#e46425', '#151515')
call NERDTreeHighlightFile('erb', 'yellow', 'none', '#35E68E', '#151515')
call NERDTreeHighlightFile('haml', 'yellow', 'none', '#e46425', '#151515')
call NERDTreeHighlightFile('jbuilder', 'yellow', 'none', '#32C9C9', '#151515')
call NERDTreeHighlightFile('scss', 'cyan', 'none', '#24abe2', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('example', 'yellow', 'none', '#FAA7E5', '#151515')
call NERDTreeHighlightFile('png', 'yellow', 'none', '#FAF0A7', '#151515')
call NERDTreeHighlightFile('jpg', 'yellow', 'none', '#FAAD69', '#151515')
call NERDTreeHighlightFile('.vimrc', 'yellow', 'none', '#90FA7D', '#151515')

