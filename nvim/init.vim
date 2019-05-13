call plug#begin('~\AppData\Local\nvim\plugged')
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes' " for visualstudio color theme.
Plug 'rhysd/vim-clang-format'
Plug 'w0rp/ale'               " linting.
call plug#end()

set autowrite         " write when switching buffers
set autowriteall      " write on :quit
set clipboard=unnamed " cut/paste to system clipboard by default
set encoding=utf-8
set noerrorbells      " No bells!
set noexpandtab
set number            " What line is it?
set shiftwidth=4        
set softtabstop=4
set tabstop=4
set nospell           " disable spelling
set noswapfile        " disable swapfile usage
set novisualbell      " I said, no bells!

" Kick vim into realizing 256 color terms.
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
endif
if &t_Co > 2 || has("gui_running")
  syntax on
  colorscheme visualstudio
endif

" ----------------------------------------------------------------------------
" Plugin: netrw
" ----------------------------------------------------------------------------
let g:netrw_banner = 0        " Hide useless banner at top.
let g:netrw_liststyle = 1     " Detailed view

" Start file explorer.
map ,f :e <C-R>=expand("%:p:h")<CR>

" ----------------------------------------------------------------------------
" Plugin: jlanzarotta/bufexplorer
" ----------------------------------------------------------------------------
"let g:bufExplorerSortBy='mru'
map ,e :BufExplorer<CR>

" ----------------------------------------------------------------------------
" Plugin: vim-airline/vim-airline
" ----------------------------------------------------------------------------
set laststatus=2                   
let g:airline_theme='papercolor'

" Enable top tabline.
let g:airline#extensions#tabline#enabled = 0

" Disable showing tabs in the tabline.  This will ensure that only the buffers
" are shown in the tabline.
let g:airline#extensions#tabline#show_tabs = 0

" Enable powerline fonts.
let g:airline_powerline_fonts = 0

" Explicitly define some symbols.
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_symbols.branch = ''
" let g:airline_symbols.maxlinenr = ''


" ----------------------------------------------------------------------------
" Plugin: w0rp/ale
" ----------------------------------------------------------------------------
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1 " enable integration with airline


" ----------------------------------------------------------------------------
" Plugin: rhsyd/vim-clang-format
" ----------------------------------------------------------------------------
let g:clang_format#detect_style_file = 1   " use .clang-format file
let g:clang_format#auto_format = 1         " format the current buffer on save.
map <C-R><C-F> :ClangFormat<CR>
imap <C-R><C-F> :ClangFormat<CR>


" ----------------------------------------------------------------------------
" Language: Go
" ----------------------------------------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"         " auto import dependencies


" ----------------------------------------------------------------------------
" ----------------------------------------------------------------------------
" Autosave buffers when leaving them.
autocmd BufLeave * silent! :wa 

" Indent visual block.
vmap <Tab> >gv

" Unindent visual block.
vmap <S-Tab> <gv
