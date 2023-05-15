return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  config = {
    load = {
      ["core.defaults"] = {},  -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.export"] = {},
      ["core.summary"] = {},
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes",
          },
        },
      },
    },
  },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      'lukas-reineke/headlines.nvim',
      dependencies = "nvim-treesitter/nvim-treesitter",
      config = true
    }
  },
}
