let g:javascript_plugin_jsdoc = 1

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

let g:ycm_autoclose_preview_window_after_insertion = 1

map ,yd :YcmCompleter GoTo<CR>
map ,yr :YcmCompleter RefactorRename<CR>
map ,yi :YcmCompleter OrganizeImports<CR>

"let s:lsp = '$HOME/.config/lsp'
let g:ycm_language_server = [
  \   { 'name': 'vue',
  \     'filetypes': [ 'vue' ], 
  \     'cmdline': [ 'vls' ]
  \   } ]
