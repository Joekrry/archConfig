-- vimtex -> vimtex (kept as-is; it's already the standard on Neovim too)
return {
  "lervag/vimtex",
  ft = { "tex", "latex" },
  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_method = "latexmk"
    -- vim.o.conceallevel = 2   -- uncomment for math/symbol concealment
    -- vim.g.tex_conceal = "abdmg"
  end,
}
