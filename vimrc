" do not be Vi-compatible
set nocompatible

" vim options
" more information here: http://vimdoc.sourceforge.net/htmldoc/options.html
set autoindent                      " auto indent based on previous line
set background=dark                 " use dark highlighting
set backspace=indent,eol,start      " allow backspacing over indent, line breaks, and start of insert
set nobackup                        " keep a backup file
set colorcolumn=81,121              " set a column marker
set cursorline                      " underline the current line where the cursor is
set noerrorbells                    " do not make error noises
set expandtab                       " use spaces in place of tabs
set foldenable                      " enable collapsing of lines
set hidden                          " allow buffers to remain loaded
set history=100                     " number of commands that are remembered
set hlsearch                        " highlight searches
set ignorecase                      " ignore case in searches
set incsearch                       " highlight searches while typing
set linespace=0                     " number of pixel lines in between characters
set mouse=a                         " use a mouse for all modes
set number                          " show line numbers
set ruler                           " show the ruler
set scrolljump=5                    " number of lines to jump when scrolling
set scrolloff=3                     " number of lines to keep above and below cursor
set shiftwidth=2                    " number of spaces to use for indent
set showcmd                         " show command in status line
set noshowmatch                     " jump to matching bracket when inserted
set showmode                        " message on status line to show current mode
set smartcase                       " ignore ignorecase when pattern has uppercase characters
set softtabstop=2                   " number of spaces that tab uses while editing
set noswapfile                      " keep a swap file
set t_Co=256                        " use 256-bit colors
set tabstop=2                       " number of spaces that tab uses
set termguicolors                   " use terminal colors
set textwidth=0                     " disable maximum width for inserted text
set updatetime=1000                 " time in milliseconds to refresh file
set virtualedit=""                  " configure cursor movement in command mode
set wildmenu                        " use menu for line completion
set nowrap                          " wrap lines
set nowritebackup                   " make a backup when writing to a file

filetype plugin indent on           " load plugin files, indent files, and enable filetype detection
syntax on                           " enable syntax highlighting

" netrw
let g:netrw_liststyle = 3

" hashivim/vim-terraform
let g:terraform_fmt_on_save = 1

" fatih/vim-go
let g:go_auto_type_info = 1
let g:go_def_mode = "gopls"
let g:go_fmt_command = "goimports"
let g:go_info_mode = "gopls"
let g:go_auto_sameids = 1
" let g:go_metalinter_command = "golangci-lint"

" morhetz/gruvbox
let g:gruvbox_italic = 1

try
colorscheme gruvbox                 " use the gruvbox colorscheme
catch
colorscheme default                 " use the default colorscheme
endtry
