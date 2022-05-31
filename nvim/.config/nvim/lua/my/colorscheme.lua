vim.cmd [[
try
    set background=dark
    colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
endtry
]]

-- Configure colorizer to hightlight colors in their own color
require'colorizer'.setup()
