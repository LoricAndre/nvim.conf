local nmap = require 'utils'.nmap
return {
  -- 'https://codeberg.org/landre/OneTerm.nvim',
  dir = "~/src/OneTerm.nvim/",
  config = function()
    local ot = require 'oneterm'

    vim.g.oneterm_yank = true
    vim.g.oneterm_options = { border = "rounded" }
    vim.g.oneterm_sessions_path = vim.fn.expand(vim.fn.stdpath('data') .. '/sessions/')
    vim.g.oneterm_width = 0.85
    vim.g.oneterm_height = 0.85
    vim.g.oneterm_y_pos = 0.25

    nmap { "<leader>f", ot.files_or_git_files }
    nmap { "<leader>F", ot.files }
    nmap { "<leader>s", ot.lines }
    nmap { "<leader>a", ot.ag }
    nmap { "<leader>g", ot.git }
    nmap { "<leader>lr", ot.references }
    nmap { "<leader>ls", ot.symbols }
    nmap { "<leader>lS", ot.ws_symbols }
    nmap { "<leader>b", ot.buffers }
    nmap { "<leader>y", ot.yanks }
    nmap { "<leader>t", ot.term }
    nmap { "<leader>r", ot.ranger }
    nmap { "<leader>b", ot.buffers }
  end
}
