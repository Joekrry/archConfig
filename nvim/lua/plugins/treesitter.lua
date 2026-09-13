-- vim-polyglot + vim-javascript + typescript-vim + vim-markdown +
-- vim-python-pep8-indent + rust.vim (indent/highlight parts) -> nvim-treesitter
--
-- NOTE: nvim-treesitter's `main` branch (the current default, required on
-- Nvim 0.12+) needs the `tree-sitter` CLI on PATH to compile parsers, plus a
-- C compiler. Install it via your package manager (e.g. `cargo install
-- tree-sitter-cli`, or your distro's `tree-sitter-cli` package) — `:TSUpdate`
-- will fail with an ENOENT until it's present.
local parsers = {
  "lua", "vim", "vimdoc",
  "python", "javascript", "typescript", "tsx",
  "html", "css", "json", "yaml",
  "markdown", "markdown_inline",
  "bash", "rust", "ruby", "latex",
}

-- Vim filetypes to attach treesitter to (parser names above don't always
-- match the filetype: vimdoc -> help, latex -> tex, bash -> sh).
local filetypes = {
  "lua", "vim", "help",
  "python", "javascript", "javascriptreact", "typescript", "typescriptreact",
  "html", "css", "json", "yaml",
  "markdown",
  "sh", "bash", "rust", "ruby", "tex",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").install(parsers)

    local augroup = vim.api.nvim_create_augroup("Treesitter", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = augroup,
      pattern = filetypes,
      callback = function()
        pcall(vim.treesitter.start)
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
