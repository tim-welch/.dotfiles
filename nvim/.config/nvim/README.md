Learn how to use vim:
  - vim tutor
  - ThePrimeagen on YouTube
  - ThePrimeagen/vim-be-good plugin - game to improve basic motions


| Mode | Description |
| ---- | ----------- |
| n | normal |
| i | insert |
| v | visual select |
| V | visual select lines |
| c | command |


## Standard
leader: \


| Mode | Command | Description |
| ---- | ------- | ----------- | 
| n | :Ex | Open netrw filesystem explorer and editer |
| n | C-^ | Open netrw filesystem explorer and editer |
| n | :e <path/to/file> | open a file to edit |

netrw:

| Mode | Command | Description |
| ---- | ------- | ----------- | 
| Ex | % | Create file |
| Ex | d | Create directory |

Motion:

In normal and visual modes

| Keys | Description |
| ---- | ----------- |
| hjkl | left, down, up, right |
| b, w | back and forward by word |
| B, W | back and forward by big word |
| _ or ^ | beginning of line |
| 0 | first character |
| $ | end of line |
| f<char> | forward onto <char> |
| t<char> | forward up to <char> |
| F<char> | back onto <char> |
| T<char> | back up to <char> |
| , and ; | repeat last f, F, t, T (backward and forward) |

Entering insert mode:

In normal mode

| Keys | Description |
| ---- | ----------- |
| i | insert at current cursor position |
| a | insert after current cursor position |
| I | insert at beginning of line |
| A | insert at end of line |
| c<count><motion> | insert replacing char from cursor to motion |
| ciw | insert replacing the word the cursor is in |
| o | newline below cursor |
| O | newline above cursor |



Windows:



## My Config
leader: <space>
<space>: <Nop> except as <leader>

- LSP:

| Mode | Command | Description |
| ---- | ------- | ----------- | 
| n    | gd      | Goto Definition |
| n    | gD      | Goto Declaration |
| n    | gr      | Goto References |
| n    | gI      | Goto Implementation |
| n | <leader>D | Goto type definition |
| n | <leader>ds | Show symbols in document |
| n | <leader>ws | Show symbols in workspace |
| n | K | Show documentation |
| n | <c-k> | Show signature documentation |
| n | <leader>wa | Workspace Add Folder |
| n | <leader>wr | Workspace Remove Folder |
| n | <leader>wl | Workspace List Folders |


- Files:

| Mode | Command | Description |
| ---- | ------- | ----------- | 
| n | <leader>? | Find recently opened files |
| n | <leader><space> | Find existing buffers |
| n | <leader>sf | [S]earch for a [F]ile |

- Search:

| Mode | Command | Description |
| ---- | ------- | ----------- | 
| n | <leader>/ | Fuzzy search in current buffer |
| n | <leader>sh | [S]earch [H]elp |
| n | <leader>sw | [S]earch for current [W]ord |
| n | <leader>sg | [S]earch using [G]rep |
| n | <leader>sd | [S]earch [D]iagnostic |

- Selection:
Most of these require a language treesitter is parsing.

| Mode | Command | Description |
| ---- | ------- | ----------- | 
| n | <c-space> | init selection |
| v | <c-space> | expand selection by node |
| v | <c-s> | expand selection by scope |
| v | <c-backspace> | decrease selection |

- Text objects:
e.g. caa

| Keys | Description |
| ---- | ----------- |
| aa | parameter outer |
| ia | parameter inner |
| af | function outer |
| if | function inner |
| ac | class outer |
| ic | class inner |

- Motion:

| Keys | Description |
| ---- | ----------- |
| ]m | goto next start function outer |
| ]] | goto next start class outer |
| ]M | goto next end function outer |
| ][ | goto next end class outer |
| [m | goto previous start function outer |
| [[ | goto previous start class outer |
| [M | goto previous end function outer |
| [] | goto previous end class outer |

- Refactoring:

| Mode | Command | Description |
| ---- | ------- | ----------- | 
| n | <leader>a | swap this parameter with the next |
| n | <leader>A | swap this parameter with the previous |
| n | <leader>rn | rename |
| n | <leader>ca | code action |

- Diagnostics:

| Mode | Command | Description |
| ---- | ------- | ----------- | 
| n | [d | Goto previous diagnostic |
| n | ]d | Goto next diagnotic |
| n | <leader>e | Open floating diagnostic window - does this work? |
| n | <leader>q | Open window with list of diagnostics |

- Completion:

See cmp.setup in init.lua. I'm not sure how this works.

