-- 1:1 port of the `set ...` lines in ~/.vim_runtime/my_configs.vim
local opt = vim.opt

opt.backup = false
opt.writebackup = false
opt.swapfile = false

opt.clipboard = "unnamedplus"

opt.cmdheight = 2
opt.conceallevel = 0
-- set conceallevel=2       " uncomment for math/symbol concealment (vimtex)
opt.fileencoding = "utf-8"

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.mouse = "a"
opt.pumheight = 10
opt.showmode = false
opt.showtabline = 2
opt.smartindent = true

opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 1000
opt.undofile = true
opt.updatetime = 300

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4

opt.cursorline = false
opt.number = true
opt.relativenumber = false
opt.numberwidth = 4
opt.signcolumn = "yes"

opt.wrap = false
opt.scrolloff = 4
opt.sidescrolloff = 4

opt.guifont = "JetBrainsMono Nerd Font:h11"
opt.termguicolors = true

-- Disable the "NVIM" intro/landing screen shown on an empty buffer.
opt.shortmess:append("I")

vim.g.mapleader = " "
vim.g.maplocalleader = " "
