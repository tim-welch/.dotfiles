" Configure clang-format
" This script requires clang-format.py to be in ~/.local/share/clang.
" Simply `ln -s /usr/share/clang ~/.local/share/clang` modifying the path to
" the location where your clang scripts are installed.

" function to format the file
function! FormatCppFile()
    let l:formatdiff = 1
    py3f ~/.local/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.cxx call FormatCppFile()
