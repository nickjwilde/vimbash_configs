set ignorecase
set autoindent
set number
set relativenumber
set incsearch
set autochdir
set hlsearch
set whichwrap+=<,>,h,l,[,]
set smartindent
" Used for python
set tabstop=4
set expandtab
set shiftwidth=4
set ruler
set showcmd
set laststatus=2 " Always show status line

set backupext=.bak

let mapleader = ","
let maplocalleader = ";"

syntax on

if !has('gui_running')
    set t_Co=256
endif

inoremap <Leader>jk <Esc>

nnoremap <CR> :nohls<CR>
nnoremap <Space> $
nnoremap <Tab> ^
nnoremap Y y$
"swap ' and ` for marks
nnoremap <Leader>' `
nnoremap <Leader>` '
nnoremap <Leader>w <C-w>

cnoremap zx q!
cnoremap zz wq!
cnoremap <Leader>nt NERDTree<CR>

let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ }

if &term =~ "xterm\\|rxvt"
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/cust_plugins')
" Make sure you use single quotes on repos

Plug 'scrooloose/nerdtree'

" Enable git markings for nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Pretty statusline
Plug 'itchyny/lightline.vim'

" Git markings on lines
Plug 'airblade/vim-gitgutter'

call plug#end()

au Filetype html,xml source ~/.vim/scripts/wrapwithtag.vim
