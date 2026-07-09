call plug#begin('~/.vim/plugged')
Plug 'ghifarit53/tokyonight-vim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
let g:polyglot_disabled = ['latex']
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
Plug 'Joekrry/vimline-errors'
Plug 'girishji/vimcomplete'
call plug#end()

" VimTeX
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
" set conceallevel=2       " uncomment for math/symbol concealment
" let g:tex_conceal='abdmg'

set termguicolors
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
silent! colorscheme tokyonight
let g:lightline = { 'colorscheme': 'tokyonight' }

" Options
set nobackup nowritebackup noswapfile
set clipboard=unnamedplus
set cmdheight=2 conceallevel=0 fileencoding=utf-8
set hlsearch incsearch ignorecase smartcase
set mouse=a pumheight=10 noshowmode showtabline=2 smartindent
set splitbelow splitright timeoutlen=1000 undofile updatetime=300
set expandtab shiftwidth=4 tabstop=4
set nocursorline number norelativenumber numberwidth=4 signcolumn=yes
set nowrap scrolloff=4 sidescrolloff=4
set guifont=JetBrainsMono\ Nerd\ Font:h11

syntax on
source $VIMRUNTIME/defaults.vim

augroup FileTypeSpecific
  autocmd!
  autocmd FileType html,css,javascript,lua setlocal shiftwidth=2 tabstop=2
augroup END
autocmd BufEnter * setlocal formatoptions-=cro

" Keymaps
let mapleader = " "
let maplocalleader = " "
nnoremap <Space> <Nop>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-Up>    :resize +1<CR>
nnoremap <C-Down>  :resize -1<CR>
nnoremap <C-Left>  :vertical resize -1<CR>
nnoremap <C-Right> :vertical resize +1<CR>
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>
nnoremap Q <nop>
vnoremap <A-j> :m .+1<CR>==
vnoremap <A-k> :m .-2<CR>==
vnoremap p "_dP
xnoremap J :move '>+1<CR>gv=gv
xnoremap K :move '<-2<CR>gv=gv
xnoremap p "_dP
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
