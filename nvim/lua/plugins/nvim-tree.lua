-- nerdtree -> nvim-tree.lua
-- Keymaps (<leader>e, <leader>n, <C-t>, <C-n>, <C-f>) are in config/keymaps.lua,
-- ported directly from the NERDTree bindings in my_configs.vim.
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFile" },
  opts = {
    view = { width = 30 },
    renderer = { group_empty = true },
    filters = { dotfiles = false },
  },
}
