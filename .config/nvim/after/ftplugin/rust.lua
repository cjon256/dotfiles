-- luacheck: globals vim
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>vc", function()
  vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr, desc = "RustLSP Code Action" })

-- " https://github.com/rust-lang/rust.vim/blob/master/ftplugin/rust.vim
--
-- if get(b:, 'current_compiler', '') ==# ''
--     if strlen(findfile('Cargo.toml', '.;')) > 0
--         compiler cargo
--     else
--         compiler rustc
--     endif
-- endif
local ol = vim.opt_local
ol.tabstop = 4
ol.shiftwidth = 4
ol.softtabstop = 4
