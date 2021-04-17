" General settings
autocmd! BufWritePost ~/.config/nvim/* source %  " Automatically source vimrc when it is saved
autocmd! BufWritePost ~/.vim/* source %  " Automatically source vimrc when it is saved
syntax enable                            " Enable syntax highlighting
"set term=xterm                           " Required for mouse when running vim in alacritty
set mouse=a                              " Enable the mouse
set hidden                               " Key multiple buffers open
set encoding=utf-8                       " Use utf-8
set fileencoding=utf-8                   " Use utf-8 when saving file
set nobackup                             " Don't backup edited files
set nowritebackup                        " Don't backup edited files
set clipboard=unnamedplus                " Copy and paste between vim and the rest of the system
set list listchars=tab:»·,trail:·,nbsp:· " Display whitespace
set nojoinspaces                         " One space when joining lines
let g:is_posix=1                         " Assume a POSIX-compatible shell for syntax highlighting
set spellfile=~/.config/nvim/spell-en.utf-8.add  " Spellfile for my additions
set complete+=kspell                     " Autocomplete with dictionary words when spell check is on
set diffopt+=vertical                    " Display diffs vertically
filetype plugin indent on                " Enable auto indentation

