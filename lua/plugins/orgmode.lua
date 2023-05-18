return {
  'nvim-orgmode/orgmode',
  dependencies = {
    {'akinsho/org-bullets.nvim', config = true},
    {'lukas-reineke/headlines.nvim', config = true},
  },
  config = function()
    require('orgmode').setup_ts_grammar()
    require('orgmode').setup({
      org_agenda_files = {'~/notes/*'},
      org_default_notes_file = '~/notes/index.org',
    })
  end
}
