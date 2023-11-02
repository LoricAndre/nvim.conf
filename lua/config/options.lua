-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local options = {
  autoindent = true,
  backspace = "indent,eol,start",
  clipboard = "unnamedplus",
  completeopt = "menuone,noselect",
  expandtab = true,
  foldexpr = "nvim_treesitter#foldexpr()",
  foldmethod = "expr",
  hidden = true,
  smartcase = true,
  incsearch = true,
  mouse = "a",
  number = true,
  relativenumber = true,
  ruler = true,
  scrolloff = 4,
  shiftwidth = 2,
  showmode = true,
  smarttab = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  termguicolors = true,
  guifont = "monospace",
  timeoutlen = 300,
  undodir = vim.fn.stdpath("data") .. "/undodir",
  undofile = true,
  wildmenu = true,
  signcolumn = "no",
  laststatus = 3,
  splitkeep = "screen",
}

if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.75
end

if vim.fn.has("win32") then
  options.shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"
  options.shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  options.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  options.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  options.shellquote = ""
  options.shellxquote = ""
end

for k, v in pairs(options) do
  vim.o[k] = v
end
