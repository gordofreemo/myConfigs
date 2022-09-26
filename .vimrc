syntax on
filetype plugin indent on

set t_Co=256
set background=dark
colorscheme oceanic_material 

set colorcolumn=80,100

set nu
set autoindent
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

let g:indentLine_setConceal = 0 " Don't convert symbols to visual


let g:python_recommended_style = 0 

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_disable_TH = 1
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_indent_disable = 1
let g:haskell_classic_highlighting = 1