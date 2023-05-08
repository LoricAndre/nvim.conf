return {
  'feline-nvim/feline.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons', 'lewis6991/gitsigns.nvim' },
  config = function()
    vim.opt.termguicolors = true
    require('gitsigns').setup {}
    require('feline').setup {}
  end
}
