" Do not be Vi-compatible.
set nocompatible

" Set the leader to comma.
let mapleader=','


" Install vim-plug if not already installed.
if empty(glob(stdpath('data') . '/site/autoload/plug.vim'))
  silent! execute "!curl -fLo " . stdpath('data') . "/site/autoload/plug.vim "
    \ . "--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Plugins installed by vim-plug.
call plug#begin(stdpath('data'))
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hashicorp/sentinel.vim'
Plug 'hashivim/vim-terraform'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
call plug#end()


" Copy indent from current line when starting a new line.
set autoindent

" Tell Vim what the background color looks like.
set background=dark

" Allow backspacing over autoindent, line breaks, and the start of insert.
set backspace=indent,eol,start

" Do not make a backup before overwriting a file.
set nobackup

" Number of screen lines to use for command-line.
set cmdheight=2

" A comma separated list of screen columns that are highlighted.
set colorcolumn=81,121

" Highlight the screen line of the cursor.
set cursorline

" Do not ring the bell for error messages.
set noerrorbells

" Use the appropriate number of spaces to insert a tab.
set expandtab

" A column with the specified width to indicate open and closed folds.
set foldcolumn=1

" Allow folds to be open or closed.
set foldenable

" Do not unload a buffer when it is abandoned.
set hidden

" Number of commands and search patterns that are remembered.
set history=100

" When there is a previous search pattern, highlight all its matches.
set hlsearch

" Ignore case in search patterns.
set ignorecase

" While typing a search command, show where the pattern matches.
set incsearch

" Wrap long lines at a character within `breakat`.
set linebreak

" Number of pixel lines inserted between characters.
set linespace=0

" Print the line number in front of each line.
set number

"Show the line and column number of the cursor position, separated by a comma.
set ruler

" When and how to draw the signcolumn.
set signcolumn=auto

" Minimal number of lines to scroll when the cursor gets off the screen.
set scrolljump=5

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=3

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=2

" Show (partial) command in the last line of the screen.
set showcmd

" When a bracket is inserted, do not briefly jump to the matching one.
set noshowmatch

" If in Insert, Replace, or Visual modue put a message on the last line.
set showmode

" Override the `ignorecase` option if the search pattern contains uppercase
" characters.
set smartcase

" Number of spaces that a tab counts for while performing editing operations.
set softtabstop=2

" Do not use a swapfile for the buffer.
set noswapfile

" Number of spaces that tab in the file counts for.
set tabstop=2

" Enables 24-bit RGB color in the TUI.
set termguicolors

" Maximum width of text that is being inserted.
set textwidth=0

" If nothing is typed in this many milliseconds the swapfile will be written
" to disk.
set updatetime=300

" Virtual editing means that the cursor can be positioned where there is no
" actual character.
set virtualedit=""

" Command-line completion operates in an enhanced mode.
set wildmenu

" When on, lines longer than the width of the window will wrap and displaying
" continues on the next line.
set wrap

" Do not make a backup before overwriting a file.
set nowritebackup

" Load the plugin files, the indent files, and enable file type detection.
filetype plugin indent on

" Enable syntax highlighting.
syntax on


" Plugin neoclide/coc.nvim.
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language
" server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" Plugin fatih/vim-go.
let g:go_auto_sameids=1
let g:go_auto_type_info=1
let g:go_code_completion_enabled=0
let g:go_def_mapping_enabled=0
let g:go_def_mode='gopls'
let g:go_fmt_command="goimports"
let g:go_gopls_enabled=1
let g:go_gopls_options=['-remote=auto']
let g:go_highlight_extra_types=1
let g:go_info_mode='gopls'
let g:go_referrers_mode='gopls'
let g:go_term_enabled=1
let g:go_term_height=10
let g:go_term_mode="split"


" Plugin hashivim/vim-terraform
let g:terraform_fmt_on_save=1


" Plugin morhetz/gruvbox.
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'medium'


" Plugin tpope/vim-commentary.
autocmd FileType sentinel setlocal commentstring=#\ %s


" Plugin vim-airline/vim-airline.
let g:airline_powerline_fonts = 1


" Switch between windows easier.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Split windows.
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>


" Load gruvbox colorscheme.
try
  colorscheme gruvbox
catch
  colorscheme default
endtry
