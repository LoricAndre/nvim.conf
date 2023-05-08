local nmap = require 'utils'.nmap

require 'obsidian'.setup {
  dir = "~/Documents/Notes/",
  completion = {
    nvim_cmp = true
  }
}

function _obsidian_gf()
  print("aaa")
  if require('obsidian').util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end

nmap { 'gf', _obsidian_gf, expr = true }
