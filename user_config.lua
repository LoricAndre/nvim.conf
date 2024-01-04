local M = {}

-- -- add any null-ls sources you want here
M.setup_sources = function(b)
  return {
    b.formatting.autopep8,
    b.code_actions.gitsigns,
  }
end

-- -- add sources to auto-install
M.ensure_installed = {
  null_ls = {
    "stylua",
    "jq",
  },
  dap = {
    "python",
  },
}

-- -- add servers to be used for auto formatting here
M.formatting_servers = {
  ["rust_analyzer"] = { "rust" },
  ["lua_ls"] = { "lua" },
  ["null_ls"] = {
    "javascript",
    "typescript",
  },
}

-- options you put here will override or add on to the default options
M.options = {
  opt = require("user.options")
}

-- Set any to false that you want disabled in here.
-- take a look at the autocommands file in lua/core for more information
-- Default value is true if left blank
M.autocommands = {
  inlay_hints = true,
  alpha_folding = true,
  treesitter_folds = true,
  trailing_whitespace = true,
  remember_file_state = true,
  session_saved_notification = true,
  format_on_autosave = true,
  css_colorizer = true,
  cmp = true,
}

-- set to false to disable plugins
-- Default value is true if left blank
M.enable_plugins = {
  aerial = true,
  alpha = true,
  autosave = true,
  bufferline = true,
  comment = true,
  copilot = false,
  dressing = true,
  gitsigns = true,
  hop = true,
  indent_blankline = true,
  inlay_hints = true,
  lsp_zero = true,
  lualine = true,
  neodev = true,
  neoscroll = true,
  neotree = true,
  session_manager = true,
  noice = true,
  null_ls = true,
  autopairs = true,
  cmp = true,
  colorizer = true,
  dap = true,
  notify = true,
  surround = true,
  treesitter = true,
  ufo = true,
  onedark = true,
  project = true,
  scope = true,
  telescope = true,
  toggleterm = true,
  trouble = true,
  twilight = true,
  whichkey = true,
  zen = true,
}

-- add extra plugins in here
M.plugins = {
}

-- add extra configuration options here, like extra autocmds etc.
-- feel free to create your own separate files and require them in here
M.user_conf = function()
  require("user.mappings")
end

return M
