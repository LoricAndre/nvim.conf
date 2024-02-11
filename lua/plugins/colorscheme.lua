local colorscheme = "dracula"


local repos = {
  nordfox = "EdenEast/nightfox.nvim",
  dracula = "Mofiqul/dracula.nvim",
}

return {
  repos["dracula"],
  config = function()
    vim.cmd("colorscheme " .. colorscheme)
  end
}
