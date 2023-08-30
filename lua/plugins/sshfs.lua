local is_inside_work_tree = {}

return {
  'nosduco/remote-sshfs.nvim',
  dependencies = 'nvim-telescope/telescope.nvim',
  config = function()
    require('remote-sshfs').setup({})
    require('telescope').load_extension 'remote-sshfs'
  end,
  cmd = {
    'RemoteSSHFSConnect',
    'RemoteSSHFSEdit',
    'RemoteSSHFSFindFiles',
    'RemoteSSHFSLiveGrep'
  },
  keys = {
    {
      "<leader>f",
      function()
        if require("remote-sshfs.connections").is_connected() then
          require('remote-sshfs.api').find_files()
        else
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
        end
      end,
      noremap = true
    },
    {
      "<leader>a",
      function()
        if require("remote-sshfs.connections").is_connected() then
          require('remote-sshfs.api').live_grep()
        else
          require('telescope.builtin').live_grep()
        end
      end,
      noremap = true
    },
  }
}
