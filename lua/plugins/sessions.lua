return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
  },
  keys = {
    {"<leader>sl", function() require("persistence").load() end, desc = "[SESSION] Load"},
    {"<leader>sL", function() require("persistence").load({last = true}) end, desc = "[SESSION] Load Last"},
  }
}
