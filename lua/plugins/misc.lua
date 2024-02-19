return {
  "towolf/vim-helm",
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      vim.o.termguicolors = true
      return require("colorizer").setup()
    end
  }
}
