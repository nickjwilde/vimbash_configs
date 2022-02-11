set nocompatible

""" Settings
set encoding=UTF-8
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
set noswapfile

let mapleader = ","
let maplocalleader = ";"

syntax on

if !has('gui_running')
    set t_Co=256
endif

inoremap <Leader>jk <Esc>
inoremap <Leader>JK <Esc>
imap <Leader>e <Plug>CapsLockEnable
imap <Leader>d <Plug>CapsLockDisable


nnoremap <Leader><CR> :nohls<CR>
nnoremap <Space> $
nnoremap <Tab> ^
nnoremap Y y$
"swap ' and ` for marks
nnoremap <Leader>' `
nnoremap <Leader>` '
nnoremap <Leader>w <C-w>

map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
map <Leader>F <Plug>(easymotion-bd-F)
nmap <Leader>F <Plug>(easymotion-overwin-F)
map <Leader>t <Plug>(easymotion-bd-t)
nmap <Leader>t <Plug>(easymotion-overwin-t)
map <Leader>T <Plug>(easymotion-bd-T)
nmap <Leader>T <Plug>(easymotion-overwin-T)
map <Leader>ew <Plug>(easymotion-bd-w)
nmap <Leader>ew <Plug>(easymotion-overwin-w)
map <Leader>W <Plug>(easymotion-bd-W)
nmap <Leader>W <Plug>(easymotion-overwin-W)
map <Leader>b <Plug>(easymotion-bd-b)
map <Leader>b <Plug>(easymotion-bd-b)
nmap <Leader>B <Plug>(easymotion-overwin-B)
nmap <Leader>B <Plug>(easymotion-overwin-B)
map <Leader>e <Plug>(easymotion-bd-e)
nmap <Leader>e <Plug>(easymotion-overwin-e)
map <Leader>E <Plug>(easymotion-bd-E)
nmap <Leader>E <Plug>(easymotion-overwin-E)

""" TAB NAVIGATION
nnoremap <Leader>J J
nnoremap <Leader>K K
nnoremap J gT
nnoremap K gt


nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt

cnoremap zx q!
cnoremap zz wq!
cnoremap <Leader>nt NERDTree<CR>
cnoremap <Leader>te tabedit<space>


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/cust_plugins')
" Make sure you use single quotes on repos
"
Plug 'scrooloose/nerdtree'
"
"" Enable git markings for nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
"
"" Pretty statusline
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'

"" Git markings on lines
Plug 'airblade/vim-gitgutter'

"" Syntax error highlighting
Plug 'vim-syntastic/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'ryanoasis/vim-devicons'

let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ 'coc-pyright'
  \ ]

call plug#end()

colorscheme codedark

let g:lightline = {
            \ 'colorscheme': 'codedark',            
            \ }

if &term =~ "xterm\\|rxvt"
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
endif


autocmd VimEnter * NERDTree | wincmd p

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

autocmd Filetype html,xml source ~/.vim/scripts/wrapwithtag.vim
