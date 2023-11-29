return {
  build = function()
    local blocks = {
      "file",
      "spacer",
      "mode"
    }
    local statusline_string = ""
    for _, block in ipairs(blocks) do
      statusline_string = statusline_string .. [[%{luaeval('require("statusline").blocks["]] .. block .. [["]()')}]]
    end
    return statusline_string
  end,
  blocks = {
    mode = function()
      local match = {
        i = " ",
        v = "󰩬 ",
        s = "󰩬 ",
      }
      return match[vim.fn.mode():lower():sub(1, 1)] or ""
    end,
    file = function()
      local file = vim.fn.expand("%")
      local res = ""
      -- for _, dir in ipairs(file:split("/")) do

      -- end
      return file
    end,
    spacer = function()
      return " "
    end
  }
}
