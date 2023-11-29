return {
  'Exafunction/codeium.vim',
  keys = {
    { '<Tab>', function () return vim.fn['codeium#Accept']() end, { expr = true } },
    { '<c-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true } },
    { '<c-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true } },
    { '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true } },
  }
}
