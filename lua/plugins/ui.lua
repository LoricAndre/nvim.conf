return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,

            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true,        -- add a border to hover docs and signature help

        },

      }
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "arkav/lualine-lsp-progress"
    },
    opts = {
      extensions = {
        "lazy",
        "symbols-outline",
        "quickfix"
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename', 'symbols-outline' },
        lualine_x = { 'lsp_progress', 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
    event = "VeryLazy",
    keys = {
      { "<leader>gs", function() return require("gitsigns").stage_hunk() end,                                            desc = "[GIT] Stage Hunk" },
      { "<leader>gs", function() return require("gitsigns").stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end,      desc = "[GIT] Stage Selected",      mode = "v" },
      { "<leader>gu", function() return require("gitsigns").undo_stage_hunk() end,                                       desc = "[GIT] Unstage Hunk" },
      { "<leader>gu", function() return require("gitsigns").undo_stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, desc = "[GIT] Unstage Selected",    mode = "v" },
      { "<leader>gr", function() return require("gitsigns").reset_hunk() end,                                            desc = "[GIT] Reset Hunk" },
      { "<leader>gr", function() return require("gitsigns").reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end,      desc = "[GIT] Reset Selected",      mode = "v" },
      { "<leader>gp", function() return require("gitsigns").preview_hunk() end,                                          desc = "[GIT] Preview Hunk" },
      { "<leader>gp", function() return require("gitsigns").preview_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end,    desc = "[GIT] Preview Selected",    mode = "v" },
      { "<leader>gS", function() return require("gitsigns").stage_buffer() end,                                          desc = "[GIT] Stage Buffer" },
      { "<leader>gR", function() return require("gitsigns").reset_buffer() end,                                          desc = "[GIT] Reset Buffer" },
      { "<leader>gb", function() return require("gitsigns").blame_line() end,                                            desc = "[GIT] Blame Line" },
      { "<leader>gB", function() return require("gitsigns").toggle_current_line_blame() end,                             desc = "[GIT] Blame Line" },
      { "<leader>gd", function() return require("gitsigns").diffthis() end,                                              desc = "[GIT] Diff Hunk" },
      { "<leader>gt", function() return require("gitsigns").toggle_deleted() end,                                        desc = "[GIT] Toggle Deleted Lines" },
    }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    'stevearc/aerial.nvim',
    opts = {
      keymaps = {
        ["m"] = "actions.tree_open",
        ["j"] = "actions.tree_close",
        ["M"] = "actions.tree_open_recursive",
        ["J"] = "actions.tree_close_recursive",
      }
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    commands = {
      "AerialToggle",
      "AerialOpen",
      "AerialOpenAll",
      "AerialNext",
      "AerialNext",
      "AerialGo",
      "AerialInfo",
      "AerialNavToggle",
      "AerialNavOpen",
    },
    keys = {
      { "<leader>ua", function() require("aerial").toggle() end,     desc = "[UI] Toggle Aerial" },
      { "<leader>uA", function() require("aerial").nav_toggle() end, desc = "[UI] Toggle Aerial" },
    }
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {}
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>ue", function() require("edgy").toggle() end, desc = "[UI] Toggle Edgy" }
    },
    dependencies = {
      "nvim-tree.lua",
      "toggleterm.nvim",
      "aerial.nvim"
    },
    opts = {
      bottom = {
        {
          ft = "toggleterm",
          title = "Terminal",
          size = { height = 0.3 },
          -- exclude floating windows
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
          pinned = true,
          open = function()
            require("toggleterm").toggle()
          end
        },
      },
      left = {
        {
          title = "Nvim Tree",
          ft = "NvimTree",
          pinned = true,
          open = "NvimTreeOpen",
        },
      },
      right = {
        {
          ft = "aerial",
          pinned = true,
          open = function()
            require("aerial").open()
          end
        }
      }
    }
  }
}
