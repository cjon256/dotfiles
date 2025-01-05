-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local o = vim.opt

-- slightly nicer whitespace display
o.listchars = "eol:¬,tab:▸ ,space:·,trail:~,nbsp:␣,extends:❯,precedes:❮"

o.signcolumn = "yes:2"
o.numberwidth = 4

o.cursorline = true
o.cursorcolumn = true

-- prefer not to muddy up the system clipboard
o.clipboard = ""

-- make the colors a bit nicer
vim.cmd([[
    highlight Normal guibg=NONE ctermbg=NONE
    highlight Notify guibg=#101010 guifg=#00FF00
    highlight CursorLine ctermbg=242 guibg=Grey21
    highlight CursorColumn ctermbg=242 guibg=Grey18
    highlight CopilotSuggestion ctermfg=9 guifg=#f18175
    highlight GitSignsAdd guifg=#A6E3A1 guibg=NONE
    highlight GitSignsDelete guifg=#C21807 guibg=NONE
    highlight GitSignsChange guifg=#E4A0F7 guibg=NONE
    highlight QuickScopePrimary guifg=#afdf5f gui=underline ctermfg=155 cterm=underline
    highlight QuickScopeSecondary guifg=#E4B9C4 gui=underline ctermfg=81 cterm=underline
    highlight ColorColumn guibg=#441010
    highlight MatchParen guibg=#883333 guifg=#003333
    highlight Visual guibg=#6A0D83
    ]])

-- don't fold stuff by default
o.conceallevel = 0

-- always have a status line
-- o.laststatus = 2

-- highlight these columns to remind me when stuff is wide
o.colorcolumn = "80,160"

-- ignore line length when inserting text
o.textwidth = 0

-- XXX what does this do again?
-- o.wildmenu = true

-- do better highlight when yanking
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")

-- needed only if I end up using test again
-- vim.cmd [[let test#strategy = "toggleterm"]]
