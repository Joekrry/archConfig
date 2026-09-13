-- coc.nvim -> native LSP client + nvim-lspconfig (server configs only) +
-- mason.nvim (installs servers the way coc extensions used to). Uses the
-- current vim.lsp.config/vim.lsp.enable API (Nvim 0.11+), not the
-- deprecated require('lspconfig').xxx.setup{} "framework".
-- Keymaps below are a direct port of the coc.nvim section in my_configs.vim.
return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    -- Sensible starter set; add more any time with :Mason.
    opts = {
      ensure_installed = { "lua_ls", "pyright", "ts_ls" },
      automatic_enable = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspAttachKeymaps", { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
          end

          -- Navigation (coc-definition / coc-type-definition / coc-implementation / coc-references)
          map("n", "gd", vim.lsp.buf.definition, "LSP: go to definition")
          map("n", "gy", vim.lsp.buf.type_definition, "LSP: go to type definition")
          map("n", "gi", vim.lsp.buf.implementation, "LSP: go to implementation")
          map("n", "gr", vim.lsp.buf.references, "LSP: references")

          -- Diagnostics (coc-diagnostic-prev / -next)
          map("n", "[g", function() vim.diagnostic.jump({ count = -1, float = true }) end, "LSP: prev diagnostic")
          map("n", "]g", function() vim.diagnostic.jump({ count = 1, float = true }) end, "LSP: next diagnostic")

          -- Hover docs on K (ShowDocumentation)
          map("n", "K", vim.lsp.buf.hover, "LSP: hover")

          -- Rename / code action / quickfix / format
          map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: rename")
          map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: code action")
          map("n", "<leader>qf", function()
            vim.lsp.buf.code_action({ filter = function(a) return a.isPreferred end, apply = true })
          end, "LSP: fix current")
          map({ "n", "x" }, "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "LSP: format")

          -- Highlight the symbol under the cursor (CocActionAsync('highlight'))
          if client and client:supports_method("textDocument/documentHighlight") then
            local hl_group = vim.api.nvim_create_augroup("LspDocumentHighlight-" .. bufnr, { clear = true })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              group = hl_group,
              buffer = bufnr,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
              group = hl_group,
              buffer = bufnr,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })
    end,
  },
}
