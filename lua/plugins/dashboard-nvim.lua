local sections = {
  mason = {
    icon = " ",
    desc = "Mason",
    key = "p",
    action = "Mason"
  },
  files = {
    icon = " ",
    desc = "Files",
    key = "f",
    action = "Telescope find_files"
  },
  session = {
    icon = " ",
    desc = "Load Session",
    key = "s",
    action = "SessionLoad"
  },
  config = {
    icon = " ",
    desc = "Edit config",
    key = "c",
    action = "cd " .. vim.fn.stdpath("config") .. " | Telescope find_files"
  }
}

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = "doom",
      change_to_vcs_root = true,
      config = {
        week_header = {
          enable = true
        },
        center = {
          sections.files,
          sections.session,
          sections.config,
          sections.mason,
        }
      }
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
