"Command that car receive any number of arguments and echo its
"command! -nargs=* Test echo <q-args>

"Bg command that can be invokated with bang or without. And changes its behavior
"function! Bang(bang)
"    echo "With".((a:bang)?"":"out")." bang."
"endfunction

"command! -bang Bg call Bang(<bang>0)
