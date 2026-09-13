-- tpope's plugins work identically on Neovim, so these are kept as-is
-- rather than swapped for lua ports. Default mappings unchanged
-- (cs/ds/ys for surround, gc for commentary, :Git for fugitive).
return {
  { "tpope/vim-surround", event = "VeryLazy", dependencies = { "tpope/vim-repeat" } },
  { "tpope/vim-commentary", event = "VeryLazy" },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tpope/vim-fugitive", cmd = { "Git", "Gdiffsplit", "Gvdiffsplit", "Gclog" } },
  { "tpope/vim-rhubarb", dependencies = { "tpope/vim-fugitive" }, cmd = "GBrowse" },
}
