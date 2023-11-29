return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      local opts    = {
        open_mapping = "<leader>t",
        direction = "horizontal"
      }
      -- lazygit
      local Terminal  = require('toggleterm.terminal').Terminal
      Lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

      return require("toggleterm").setup(opts)
    end,
    event   = "VeryLazy",
    keys = {
      {"<leader>gg", function() Lazygit:toggle() end, desc = "[GIT] Toggle Lazygit"},
    }
  }
}
