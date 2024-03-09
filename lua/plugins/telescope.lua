local is_inside_work_tree = {}

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local ts = require("telescope")
    local themes = require("telescope.themes")
    local has_trouble, trouble = pcall(require, "trouble.providers.telescope")
    local theme_opts = themes.get_ivy()
    local opts = {
      defaults = {
        mappings = {},
      }
    }
    opts["defaults"] = vim.tbl_extend("force", theme_opts, opts["defaults"])
    if has_trouble then
      opts["defaults"]["mappings"] = vim.tbl_extend("force", opts["defaults"]["mappings"], {
          i = {["<C-t>"] = trouble.open_with_trouble},
          n = {["<C-t>"] = trouble.open_with_trouble},
      })
    end
    ts.setup(opts)
    ts.load_extension('fzf')
    pcall(ts.load_extension, "notify")
  end,
  keys = {
    -- {
    --   "<leader>f",
    --   function()
    --     local cwd = vim.fn.getcwd()
    --     if is_inside_work_tree[cwd] == nil then
    --       vim.fn.system("git rev-parse --is-inside-work-tree")
    --       is_inside_work_tree[cwd] = vim.v.shell_error == 0
    --     end
    --     if is_inside_work_tree[cwd] then
    --       require('telescope.builtin').git_files {}
    --     else
    --       require('telescope.builtin').find_files {}
    --     end
    --   end,
    --   noremap = true,
    --   desc = "Telescope files or git files"
    -- },
    {
      "<leader>a",
      function()
          require('telescope.builtin').live_grep()
      end,
      noremap = true,
      desc = "Telescope live grep"
    },
    { "<leader>f", function() require('telescope.builtin').find_files() end, noremap = true, desc = "[TSP] Files" },
    { "<leader>b", function() require('telescope.builtin').buffers() end, noremap = true, desc = "[TSP] buffers" },
    { "<leader>cr", function() require('telescope.builtin').lsp_references() end, noremap = true, desc = "[LSP] References" },
    { "<leader>cd", function() require('telescope.builtin').lsp_definitions() end, noremap = true, desc = "[LSP] Definitions" },
    { "<leader>ci", function() require('telescope.builtin').lsp_implementations() end, noremap = true, desc = "[LSP] Implementations" },
    { "<leader>cs", function() require('telescope.builtin').lsp_document_symbols() end, noremap = true, desc = "[LSP] symbols" },
    { "<leader>cS", function() require('telescope.builtin').lsp_workspace_symbols() end, noremap = true, desc = "[LSP] WS symbols" },
  },
  cmd = {
    'Telescope'
  }
}
