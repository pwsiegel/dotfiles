" Jekyll / Markdown / Mathjax
" autocmd BufRead,BufNewFile,BufEnter *.blog set filetype=markdown

function! MathAndLiquid()
    "" Define certain regions
    " Block math. Look for "$$[anything]$$"
    syn region math start=/\$\$/ end=/\$\$/
    " Inline math. Look for "$[not $][anything]$"
    syn match math_block '\$[^$].\{-}\$'
    " Emphasized text. Look for "_[anything]_"
    syn region emph start='_' end='_'

    " Liquid single line. Look for "{%[anything]%}"
    syn match liquid '{%.*%}'
    " Liquid multiline. Look for "{%[anything]%}[anything]{%[anything]%}"
    syn region highlight_block start='{% highlight .*%}' end='{%.*%}'
    " Fenced code blocks, used in GitHub Flavored Markdown (GFM)
    syn region highlight_block start='```' end='```'
    " Liquid frontmatter
    syn region frontmatter start='---' end='---'

    "" Actually highlight those regions.
    hi link math Statement
    hi link math_block Function
    hi link emph TabLine
    hi link liquid Statement
    hi link highlight_block Function
    hi link frontmatter Type
endfunction

autocmd BufRead,BufNewFile,BufWinEnter *.md call MathAndLiquid()
