vim.g.toggleterm_initialized = false

return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup {
      on_open = function()
        vim.cmd [[startinsert]]
      end
    }
    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = 'float' })

    function _lazygit_toggle()
      lazygit:toggle()
    end
  end,
  keys = {
    { '<leader>t', function() require('toggleterm').toggle(0) end, noremap = true },
    {
      "<leader>g",
      function()
        _lazygit_toggle()
      end,
      noremap = true
    }
  }
}
