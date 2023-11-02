-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = function(mode, a)
  local lhs = a[1]
  a[1] = nil
  local rhs = a[2]
  a[2] = nil
  local opts = {
    noremap = true,
    silent = true,
  }
  for k, v in pairs(a) do
    if v ~= nil then
      opts[k] = v
    end
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

local nmap = function(a)
  map("n", a)
end
local tmap = function(a)
  map("t", a)
end
local imap = function(a)
  map("i", a)
end
local vmap = function(a)
  map("v", a)
end

nmap({ "<Tab>", "<CMD>bn<CR>" })
nmap({ "<S-Tab>", "<CMD>bp<CR>" })
nmap({ "<leader>n", "<CMD>cnext<CR>" })
nmap({ "<leader>p", "<CMD>cprev<CR>" })
nmap({ "m", "l" })
nmap({ "l", "k" })
nmap({ "k", "j" })
nmap({ "j", "h" })
nmap({ "<M-m>", "<C-w><C-l>" })
nmap({ "<M-l>", "<C-w><C-k>" })
nmap({ "<M-k>", "<C-w><C-j>" })
nmap({ "<M-j>", "<C-w><C-h>" })
nmap({ "<Esc>", "<CMD>noh<CR>" })
nmap({ "<leader><Space>", "<CMD>b#<CR>" })
nmap({ "<leader>Q", "<CMD>q<CR>" })
nmap({ "<leader>q", "<CMD>bd<CR>" })
vmap({ "m", "l" })
vmap({ "l", "k" })
vmap({ "k", "j" })
vmap({ "j", "h" })
vmap({ "<", "<gv" })
vmap({ ">", ">gv" })
tmap({ "<C-Esc>", "<C-\\><C-n>:q<CR>" })
tmap({ "jk", "<C-\\><C-n>" })
tmap({ "<M-m>", "<C-\\><C-n><C-w><C-l>" })
tmap({ "<M-l>", "<C-\\><C-n><C-w><C-k>" })
tmap({ "<M-k>", "<C-\\><C-n><C-w><C-j>" })
tmap({ "<M-j>", "<C-\\><C-n><C-w><C-h>" })
