local mason_opts = {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",

      package_uninstalled = "✗"

    }
  }
}

local lsp_handlers = {}

return {
  "williamboman/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "nvimtools/none-ls.nvim"
  },
  event = "VeryLazy",
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")

    local has_coq, coq = pcall(require, "coq_nvim")
    local has_epo, epo = pcall(require, "epo")

    mason.setup(mason_opts)
    mason_lspconfig.setup()

    mason_lspconfig.setup_handlers({
      function(server_name)
        local opts = lsp_handlers[server_name] or {}
        if has_coq then
          return lspconfig[server_name].setup(coq.lsp_ensure_capabilities(opts))
        elseif has_epo then
          return lspconfig[server_name].setup(vim.tbl_deep_extend('force', opts, {
            capabilities = vim.tbl_deep_extend(
              'force',
              vim.lsp.protocol.make_client_capabilities(),
              epo.register_cap()
            )
          }))
        else
          return lspconfig[server_name].setup(opts)
        end
      end
    })
  end,
  keys = {
    { "<leader>ca", function() return vim.lsp.buf.code_action({ apply = true }) end, desc = "[LSP] Code Action" },
    { "<leader>ca", function() return vim.lsp.buf.code_action({ apply = true }) end, mode = "v", desc = "[LSP] Code Action" },
    { "<leader>cf", function() return vim.lsp.buf.format({ async = true }) end,  desc = "[LSP] Format" },
    { "<leader>cf", function() return vim.lsp.buf.format({ async = true }) end,  mode = "v", desc = "[LSP] Format" }
  }
}
