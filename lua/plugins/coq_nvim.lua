-- This is lazy loaded, but lsp requires the module which will force load it as soon as lsp does
return {
  'ms-jpq/coq_nvim',
  branch = 'coq',
  dependencies = {
    { 'ms-jpq/coq.artifacts',  branch = 'artifacts' },
    { 'ms-jpq/coq.thirdparty', branch = '3p' }
  },
  build = ':COQdeps',
  config = function()
    vim.g.coq_settings = {
      ['keymap.recommended'] = false,
      ['keymap.jump_to_mark'] = '<C-j>',
      auto_start = 'shut-up'
    }
    vim.cmd [[COQnow --shut-up]]
  end,
  keys = {
    { '<Esc>', 'pumvisible() ? "\\<C-e><Esc>" : "\\<Esc>"', mode = 'i', expr = true },
    { '<C-c>', 'pumvisible() ? "\\<C-e><C-c>" : "\\<C-c>"', mode = 'i', expr = true },
    { '<BS>', 'pumvisible() ? "\\<C-e><BS>"  : "\\<BS>"', mode = 'i', expr = true, replace_keycodes = false },
    { '<CR>', 'pumvisible() ? (complete_info().selected == -1 ? "\\<C-e><CR>" : "\\<C-y>") : "\\<CR>"', mode = 'i', expr = true },
    { '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', mode = 'i', expr = true },
    { '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<BS>"', mode = 'i', expr = true }
  },
  lazy = false
}
