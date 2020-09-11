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

map ,yd :YcmCompleter GoTo<cr>
map ,yr :YcmCompleter RefactorRename<cr>
map ,yi :YcmCompleter OrganizeImports<cr>

let g:ycm_language_server = [ {
    \ 'name': 'vue',
    \ 'filetypes': [ 'vue' ],
    \ 'cmdline': [ 'vls'  ]
    \ } ]
