vim.g.toggleterm_initialized = false

return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      on_open = function()
        vim.cmd([[startinsert]])
      end,
    })
    local Terminal = require("toggleterm.terminal").Terminal
  end,
  keys = {
    {
      "<leader>t",
      function()
        require("toggleterm").toggle(0)
      end,
      noremap = true,
    },
  },
}
