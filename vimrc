" Vim configuration file.
" Documentation here: http://vimdoc.sourceforge.net/htmldoc.

" Do not be Vi-compatible.
set nocompatible

" Auto indent based on previous line.
set autoindent

" Use dark background.
set background=dark

" Allow backspacing over indent, line breaks, and start of insert.
set backspace=indent,eol,start

" Do not keep a backup file.
set nobackup

" Set column markers.
set colorcolumn=81,121

" Underline the current line where the cursor is.
set cursorline

" Do not make error noises.
set noerrorbells

" Use spaces instead of tabs.
set expandtab

" Enable collapsing of lines.
set foldenable

" Allow buffers to remain loaded.
set hidden

" Number of commands that are remembered.
set history=100

" Highlight searches.
set hlsearch

" Ignore case sensitivity.
set ignorecase

" Highlight searches while typing
set incsearch

" Number of pixel lines in between characters.
set linespace=0

" Show line numbers.
set number

" Show the ruler.
set ruler

" Number of lines to jump when scrolling.
set scrolljump=5

" Number of lines to keep above and below cursor.
set scrolloff=3

" Number of spaces to use for indent.
set shiftwidth=2

" Show command in status line.
set showcmd

" Jump to matching bracket when inserted.
set noshowmatch

" Message of status line to show current mode.
set showmode

" Override `ignorcase` option.
set smartcase

" Number of spaces that tab uses.
set softtabstop=2

" Keep a swap file.
set noswapfile

" Use 256-bit colors.
set t_Co=256

" Number of spaces that tab uses.
set tabstop=2

" Use terminal colors.
set termguicolors

" Disable maximum width for inserted text.
set textwidth=0

" Time to refresh file (ms).
set updatetime=1000

" Configure cursor movement in command mode.
set virtualedit=""

" Use menu for line completion.
set wildmenu

" Do not wrap lines.
set nowrap

" Do not make a backup file when writing.
set nowritebackup

" Load plugin file, indent files, and enable file type detection.
filetype plugin indent on

" Enable syntax highlighting.
syntax on

" Plugin netrw.
let g:netrw_liststyle = 3

" Plugin hashivim/vim-terraform.
let g:terraform_fmt_on_save = 1

" Plugin fatih/vim-go.
let g:go_auto_type_info = 1
let g:go_def_mode = "gopls"
let g:go_fmt_command = "goimports"
let g:go_info_mode = "gopls"
let g:go_auto_sameids = 1

" Plugin morhetz/gruvbox.
let g:gruvbox_italic = 1

" Load the gruvbox colorscheme if it's there.
try
colorscheme gruvbox
catch
colorscheme default
endtry
