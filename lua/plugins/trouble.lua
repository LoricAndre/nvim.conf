return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    action_keys = {
      previous = "l",
      next = "k"
    }
  },
  commands = {
    "Trouble",
    "TroubleToggle"
  },
  keys = {
    {"<leader>tt", function() require("trouble").toggle() end, desc = "[TROUBLE] Toggle"},
    {"<leader>td", function() require("trouble").toggle("document_diagnostics") end, desc = "[TROUBLE] Toggle Diagnostics"},
    {"<leader>tD", function() require("trouble").toggle("workspace_diagnostics") end, desc = "[TROUBLE] Toggle WS Diagnostics"},
    {"<leader>tq", function() require("trouble").toggle("quickfix") end, desc = "[TROUBLE] Toggle Quickfix"},
    {"<leader>tl", function() require("trouble").toggle("loclist") end, desc = "[TROUBLE] Toggle Loclist"},
    {"<leader>tr", function() require("trouble").toggle("lsp_references") end, desc = "[TROUBLE] Toggle LSP References"},
  }
}
