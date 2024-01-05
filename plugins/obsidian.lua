local vault = vim.fn.expand("~/Notes")

return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    "BufReadPre " .. vim.fn.expand(vault .. "/**.md"),
    "BufNewFile " .. vim.fn.expand(vault .. "/**.md"),
  },
  command = {
    "ObsidianWorkspace",
    "ObsidianToday",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "Notes",
        path = vault,
        overrides = {
          notes_subdir = "Notes",
        },
      },
    },

    daily_notes = {
      folder = "Daily Notes",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%B %-d, %Y",
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "Daily Note.md"
    },
    templates = {
      subdir = "Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      -- vim.fn.jobstart({ "open", url }) -- Mac OS
      vim.fn.jobstart({ "powershell.exe", "-c", "start", url }) -- linux
    end,
    attachments = {
      img_folder = "Assets"
    }
  },
}
