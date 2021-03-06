source $VIMRUNTIME/vimrc_example.vim
set exrc
set secure
set autoread
set tabstop=4
set shiftwidth=4
set nobackup
set nohlsearch
set autoindent
set smarttab
set showmatch
set expandtab
set shiftround
set nowarn
set noerrorbells
set visualbell t_vb=
set browsedir=buffer
set ch=2 "get rid of 'Hit enter to continue messages'
set cinoptions=g0
set cindent
set laststatus=2 "always display a status line
set noundofile
set mouse=

" Kick vim into realizing 256 color terms.
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
endif

" nvim truecolor mode
" disabled for now as the colors are too dark on iterm2 on mac
"set termguicolors

" specify directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

Plug 'https://github.com/rhysd/vim-clang-format.git'
Plug 'https://github.com/jlanzarotta/bufexplorer.git'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/rodjek/vim-puppet.git'

" Configuration headache.  Not worth the time?
" Disable this plugin for now.
" Plug 'https://github.com/arakashic/chromatica.nvim.git'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" initialize plugins.
call plug#end()

"Clang-Format
" use .clang-format file
let g:clang_format#detect_style_file = 1
" format the current buffer on save.
let g:clang_format#auto_format = 1
"map <C-R><C-F> :ClangFormat<CR>
"imap <C-R><C-F> :ClangFormat<CR>

"Chromatica
" let g:chromatica#libclang_path=glob("~/.local/lib/llvm")
" let g:chromatica#enable_at_startup=1
" let g:chromatica#responsive_mode=1
" let g:chromatica#highlight_feature_level=1


" execute pathogen#infect()

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o|d)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }

"Emulate VisualStudio shift operations.
vmap <Tab> >gv
vmap <S-Tab> <gv

"Explore the directory of the current buffer.
let g:explSuffixesLast=0
map ,f :e <C-R>=expand("%:p:h")<CR>
"map <C-`> :e <C-R>=expand("%:p:h")<CR>

"Explore the current list of buffers.
let g:bufExplorerSortBy='mru'
map ,e :BufExplorer<CR>

"Check file out of perforce.
map ,c :!p4 edit %

"Diff vs. head version in perforce.
map ,d :!start p4 diff %

"Quick Advance in error buffer.
map ,n :cn<CR>

"Kill macro shit
map q <Nop>

"Syntastic
"let g:syntastic_cpp_checkers = []
"let g:syntastic_cpp_compiler = ''
let g:syntastic_cpp_compiler_options = '-std=c++14'


"set makeprg=jam
"map ,m :!make 2>_mkerrors<CR>:cf _mkerrors<CR>

:let g:netrw_sort_sequence='[\/]$,[^\/]$,'

"au BufNewFile,BufRead *.h,*.hpp,*.c,*.cpp set tags=./tags,tags,/Users/bkusy/.vim/tags/usr/include/tags
"au BufNewFile,BufRead *.xsc			setf lua
"au BufNewFile,BufRead *.rgw,*.rgp,*.rgx setf yaml
au BufNewFile,BufRead *.h,*.hpp,*.cpp,*.c set ts=2 sw=2

augroup Binary
    au!
    au BufReadPre *.m4[ap] let &bin=1
    au BufReadPost *.m4[ap] if &bin | %!xxd
    au BufReadPost *.m4[ap] set ft=xxd | endif
    au BufWritePre *.m4[ap] if &bin | %!xxd -r
    au BufWritePre *.m4[ap] if endif
    au BufWritePost *.m4[ap] if &bin | %!xxd
    au BufWritePost *.m4[ap] set nomod | endif
augroup END
