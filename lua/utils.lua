local M = {}

local map = function(mode, a)
  local lhs = a[1]
  a[1] = nil
  local rhs = a[2]
  a[2] = nil
  local opts = {
    noremap = true,
    silent = true
  }
  for k, v in pairs(a) do
    if v ~= nil then
      opts[k] = v
    end
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

M.nmap = function(a)
  map('n', a)
end
M.tmap = function(a)
  map('t', a)
end
M.imap = function(a)
  map('i', a)
end
M.vmap = function(a)
  map('v', a)
end

local get_package_name = function(s)
  local rhs = s:gsub("^(.+)/.+$", "%1")
  local lhs = s:gsub("^.+/(.+)$", "%1")
  if lhs == "nvim" or lhs == "neovim" then -- package name from uri 'xxx/nvim' or 'xxx/neovim'
    return rhs
  end
  -- package name from uri 'xxx/yyy.nvim' or 'xxx/yyy'
  return lhs:gsub("^(.+)%.nvim$", "%1")
end

M.pack = function(a)
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git', 'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim', install_path
    })
  end

  if not pcall(require, 'packer') then
    return
  end

  return require 'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'
    for k, v in pairs(a) do
      local uri
      if type(k) == 'string' then
        uri = k
      elseif type(v[1]) == 'string' then
        uri = v[1]
      elseif type(k) == 'number' then
        uri = v
      else
        print(k, type(k))
        error("Invalid package spec. Package name must bey the key or the first element", 1)
      end
      local pkg = v
      if type(v) == 'string' then
        pkg = { v }
      end
      pkg[1] = pkg[1] or uri
      pkg.as = pkg.as or get_package_name(uri)
      pkg.config = pkg.config or string.format('local _, e = pcall(function() require("plugins.%s") end)', pkg.as)
      -- print(vim.inspect(pkg))
      use(pkg)
    end
  end)
end

M.lazy = function(a)
  -- Bootstrap
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  return require("lazy").setup(a)
end

return M
