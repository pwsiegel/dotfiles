" Ale
let g:ale_pattern_options = {'.*\.tex$': {'ale_enabled': 0}}
nmap <silent> <leader>W <Plug>(ale_previous_wrap)
nmap <silent> <leader>w <Plug>(ale_next_wrap)

" JS / HTML
let g:prettier#autoformat = 0
let g:prettier#quickfix_auto_focus = 0
let g:prettier#config#tab_width = 4
let g:prettier#config#print_width = 140
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#jsx_bracket_same_line = 'false'
set suffixesadd+=.js
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.graphql,*.vue PrettierAsync
