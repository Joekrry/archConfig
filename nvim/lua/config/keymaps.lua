-- Port of the "Keymaps" section in my_configs.vim.
-- coc.nvim mappings moved to plugins/lsp.lua (set on LspAttach).
-- NERDTree -> nvim-tree, CtrlP -> telescope.
local map = vim.keymap.set

map("n", "<Space>", "<Nop>", { silent = true })

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Centered half-page scroll
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Window resize
map("n", "<C-Up>", ":resize +1<CR>")
map("n", "<C-Down>", ":resize -1<CR>")
map("n", "<C-Left>", ":vertical resize -1<CR>")
map("n", "<C-Right>", ":vertical resize +1<CR>")

-- Buffer switching
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

map("n", "Q", "<Nop>")

-- Move lines/selection up/down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("x", "J", ":move '>+1<CR>gv=gv")
map("x", "K", ":move '<-2<CR>gv=gv")

-- Paste without yanking the replaced text
map("v", "p", '"_dP')
map("x", "p", '"_dP')

-- nvim-tree (was NERDTree)
map("n", "<leader>e", ":NvimTreeToggle<CR>")
map("n", "<leader>n", ":NvimTreeFocus<CR>")
map("n", "<C-t>", ":NvimTreeOpen<CR>")
map("n", "<C-n>", ":NvimTreeToggle<CR>")
map("n", "<C-f>", ":NvimTreeFindFile<CR>")

-- Telescope (was CtrlP / MRU / bufexplorer / ack.vim) keymaps live in
-- plugins/telescope.lua's `keys` table so they lazy-load correctly.
