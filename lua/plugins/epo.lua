return {
  "nvimdev/epo.nvim",
  opts = {
    fuzzy = true,
    debounce = 50,
    signature = true,
    snippet_path = nil,
  },
  keys = {
    {"<Tab>", function()
      if vim.fn.pumvisible() == 1 then
        return '<C-n>'
      -- elseif vim.snippet.jumpable(-1) then
      --   return '<cmd>lua vim.snippet.jump(1)<CR>'
      else
        return '<Tab>'
      end
    end,
    noremap = false,
    expr = true,
    mode = "i"
    },
    {"<S-Tab>", function()
      if vim.fn.pumvisible() == 1 then
        return '<C-p>'
      -- elseif vim.snippet.jumpable(-1) then
      --   return '<cmd>lua vim.snippet.jump(-1)<CR>'
      else
        return '<S-Tab>'
      end
    end,
    },
    noremap = false,
    expr = true,
    mode = "i"
  },
  lazy = false
}
