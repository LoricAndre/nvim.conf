local is_inside_work_tree = {}

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
  end,
  keys = {
    { "<leader>f", function()
      local cwd = vim.fn.getcwd()
      if is_inside_work_tree[cwd] == nil then
        vim.fn.system("git rev-parse --is-inside-work-tree")
        is_inside_work_tree[cwd] = vim.v.shell_error == 0
      end

      if is_inside_work_tree[cwd] then
        require('telescope.builtin').git_files {}
      else
        require('telescope.builtin').find_files {}
      end
    end },
    { "<leader>F", function() require('telescope.builtin').find_files() end, noremap = true },
    { "<leader>b", function() require('telescope.builtin').buffers() end, noremap = true },
    { "<leader>a", function() require('telescope.builtin').live_grep() end, noremap = true },
    { "<leader>lr", function() require('telescope.builtin').lsp_references() end, noremap = true },
    { "<leader>ld", function() require('telescope.builtin').lsp_definitions() end, noremap = true },
    { "<leader>li", function() require('telescope.builtin').lsp_implementations() end, noremap = true },
    { "<leader>ls", function() require('telescope.builtin').lsp_document_symbols() end, noremap = true },
    { "<leader>lS", function() require('telescope.builtin').lsp_workspace_symbols() end, noremap = true },
    -- { "<leader>g", builtin.git },
    -- { "<leader>y", builtin.yanks },
    -- { "<leader>t", builtin.term },
    -- { "<leader>r", builtin.ranger },
  }
}

