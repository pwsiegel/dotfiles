" Ale
" let g:ale_pattern_options = {
" \ '\.tex$': {'ale_enabled': 0}},
" \ '\.py$': {'ale_linters': ['flake8'], 'ale_fixers': ['black']}
" \}
let g:ale_pattern_options = {'\.py$': {'ale_linters': ['flake8', 'mypy'], 'ale_fixers': ['black', 'isort']}}
let g:ale_fix_on_save = 1
nmap <silent> <leader>W <Plug>(ale_previous_wrap)
nmap <silent> <leader>w <Plug>(ale_next_wrap)
