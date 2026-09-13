-- lightline.vim + lightline-ale -> lualine.nvim
-- Custom theme is a direct translation of the g:lightline palette that used
-- to live at the bottom of ~/.vim_runtime/m3_monochrome.vim.
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local p = require("m3_palette")

    local theme = {
      normal = {
        a = { bg = p.primary, fg = p.on_pri, gui = "bold" },
        b = { bg = p.panel, fg = p.fg },
        c = { bg = p.panel, fg = p.muted },
      },
      insert = {
        a = { bg = p.fg, fg = p.bg, gui = "bold" },
        b = { bg = p.panel, fg = p.fg },
        c = { bg = p.panel, fg = p.muted },
      },
      visual = {
        a = { bg = p.secondary, fg = p.bg, gui = "bold" },
        b = { bg = p.panel, fg = p.fg },
        c = { bg = p.panel, fg = p.muted },
      },
      replace = {
        a = { bg = p.error, fg = p.on_pri, gui = "bold" },
        b = { bg = p.panel, fg = p.fg },
        c = { bg = p.panel, fg = p.muted },
      },
      inactive = {
        a = { bg = p.panel, fg = p.muted },
        b = { bg = p.panel, fg = p.muted },
        c = { bg = p.panel, fg = p.muted },
      },
    }

    require("lualine").setup({
      options = {
        theme = theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
