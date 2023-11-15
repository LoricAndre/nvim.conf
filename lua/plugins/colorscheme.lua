local colorscheme = "nordfox"
return {
  "EdenEast/nightfox.nvim",
  config = function()
    vim.cmd("colorscheme " .. colorscheme)
  end
}
