call plug#begin('~/.vim/plugged')
Plug 'ghifarit53/tokyonight-vim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
let g:polyglot_disabled = ['latex']
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
" Disabled:( Plug 'Joekrry/vimline-errors')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" VimTeX
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
" set conceallevel=2       " uncomment for math/symbol concealment
" let g:tex_conceal='abdmg'

set termguicolors

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

source $VIMRUNTIME/defaults.vim
" Enable syntax + filetype AFTER defaults.vim (sourcing it later wipes the
" syntax-load autocmds), then load the colorscheme LAST so its highlight groups
" sit on top of the syntax defaults.
syntax on
filetype plugin indent on
" Hardcoded Material 3 monochrome colorscheme (static; edit hex values there).
source ~/.vim_runtime/m3_monochrome.vim

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

" ── coc.nvim (autocomplete + LSP) ──────────────────────────────────
" updatetime/signcolumn/pumheight are already set above (coc-friendly).

" Let coc own <CR> when the popup is visible; otherwise defer to
" auto-pairs so bracket-splitting on Enter still works.
let g:AutoPairsMapCR = 0
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \ : "\<C-g>u\<CR>\<c-r>=AutoPairsReturn()\<CR>"

" Tab / S-Tab to cycle the completion menu, <c-space> to trigger it.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Hover docs on K
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Rename / code action / quickfix / format
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ca <Plug>(coc-codeaction-cursor)
xmap <leader>ca <Plug>(coc-codeaction-selected)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>cf <Plug>(coc-format)
xmap <leader>cf <Plug>(coc-format-selected)

" Highlight the symbol under the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
