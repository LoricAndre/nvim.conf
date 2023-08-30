return {
  'AckslD/nvim-neoclip.lua',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    {'kkharji/sqlite.lua', module = 'sqlite'}
  },
  opts = {
    enable_persistent_history = true
  },
  keys = {
    { '<leader>y', function() require('telescope').extensions.neoclip.default() end, noremap = true }
  }
}
