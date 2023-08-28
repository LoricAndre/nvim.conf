local vim = vim

local nmap = require 'utils'.nmap
local vmap = require 'utils'.vmap


local config = {
  lsp = {
    on_attach = function()
      require 'virtualtypes'.on_attach()
      nmap { 'K', vim.lsp.buf.hover }
      -- nmap { '<leader>ld', vim.lsp.buf.definition }
      -- nmap { '<leader>lD', vim.lsp.buf.declaration }
      -- nmap { '<leader>li', vim.lsp.buf.implementation }
      -- nmap { '<leader>lt', vim.lsp.buf.type_definition }
      -- nmap { '<leader>lr', vim.lsp.buf.references }
      nmap { '<leader>lR', vim.lsp.buf.rename }
      -- nmap { '<leader>ls', vim.lsp.buf.document_symbol }
      -- nmap { '<leader>lS', vim.lsp.buf.workspace_symbol }
      nmap { '<leader>la', vim.lsp.buf.code_action }
      vmap { '<leader>la', vim.lsp.buf.code_action }
      nmap { '<leader>lf', function() vim.lsp.buf.format { async = true } end }
      vmap { '<leader>lf', function() vim.lsp.buf.format { async = true } end }
    end,
    capabilities = vim.lsp.protocol.make_client_capabilities()
  },
  dap = {
    setup = function()
      vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
      nmap { '<F5>', function()
        vim.g.last_dbg_buf = vim.api.nvim_get_current_buf()
        require 'dapui'.open()
        require 'dap'.continue()
      end }

      nmap { '<F17>', function()
        vim.api.nvim_set_current_buf(vim.g.last_dbg_buf)
        require 'dapui'.close()
        require 'dap'.terminate()
      end }
      nmap { '<F6>', require 'dap'.toggle_breakpoint }
      nmap { '<F7>', require 'dap'.step_over }
      nmap { '<F8>', require 'dap'.step_into }

      require 'dapui'.setup()
    end
  }
}

return {
  'williamboman/mason.nvim',
  dependencies = {
    'neovim/nvim-lspconfig', 'jubnzv/virtual-types.nvim',
    'onsails/lspkind.nvim', 'nvimdev/lspsaga.nvim',
    'kosayoda/nvim-lightbulb',
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    'theprimeagen/refactoring.nvim',
    'williamboman/mason-lspconfig.nvim',
    'jose-elias-alvarez/null-ls.nvim', 'jayp0521/mason-null-ls.nvim',
    'rcarriga/nvim-dap-ui', 'mfussenegger/nvim-dap', "jayp0521/mason-nvim-dap.nvim",
    "coq_nvim", "nvim-lua/plenary.nvim"
  },
  event = 'VeryLazy',
  config = function()
    require 'lspkind'.init {}
    require 'lspsaga'.setup {}

    require 'mason'.setup {
      install_root_dir = vim.fn.stdpath('data') .. '/mason/'
    }

    -- LSP
    require 'mason-lspconfig'.setup {
      automatic_installation = true
    }
    require 'mason-lspconfig'.setup_handlers {
      function(server)
        require 'lspconfig'[server].setup(require('coq').lsp_ensure_capabilities {
          on_attach = config.lsp.on_attach
        })
      end
    }

    -- DAP
    config.dap.setup()
    require 'mason-nvim-dap'.setup {
      automatic_setup = true,
      automatic_installation = true
    }

    -- NULL LS
    require 'mason-null-ls'.setup {
      automatic_setup = true,
      automatic_installation = true
    }
    require 'null-ls'.setup {
    }
  end
}
