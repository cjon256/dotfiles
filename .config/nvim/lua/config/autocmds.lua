-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Create an autocmd group for AppleScript-related rules,
-- to help manage and clear autocmds efficiently.
vim.api.nvim_create_augroup("AppleScriptFileType", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = "AppleScriptFileType",
  pattern = {
    "*.applescript",
  },
  callback = function()
    vim.o.filetype = "applescript"
  end,
})
