-- ctrlp.vim + mru.vim + bufexplorer + ack.vim -> telescope.nvim
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Telescope: find files" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Telescope: live grep" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Telescope: buffers" },
    { "<leader>fr", function() require("telescope.builtin").oldfiles() end, desc = "Telescope: recent files" },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Telescope: help tags" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        mappings = {
          i = { ["<C-j>"] = "move_selection_next", ["<C-k>"] = "move_selection_previous" },
        },
      },
    })
    pcall(telescope.load_extension, "fzf")
  end,
}
