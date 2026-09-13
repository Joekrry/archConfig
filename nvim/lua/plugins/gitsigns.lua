-- vim-gitgutter -> gitsigns.nvim
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end
      map("n", "]c", function() gs.nav_hunk("next") end, "Gitsigns: next hunk")
      map("n", "[c", function() gs.nav_hunk("prev") end, "Gitsigns: prev hunk")
      map("n", "<leader>hs", gs.stage_hunk, "Gitsigns: stage hunk")
      map("n", "<leader>hr", gs.reset_hunk, "Gitsigns: reset hunk")
      map("n", "<leader>hp", gs.preview_hunk, "Gitsigns: preview hunk")
      map("n", "<leader>hb", gs.blame_line, "Gitsigns: blame line")
    end,
  },
}
