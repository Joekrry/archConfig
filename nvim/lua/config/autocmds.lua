-- Port of the FileTypeSpecific augroup + formatoptions autocmd in my_configs.vim
local augroup = vim.api.nvim_create_augroup("FileTypeSpecific", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "html", "css", "javascript", "lua" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})
