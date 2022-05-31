vim.cmd [[
try
    set background=dark
    colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
endtry
]]
