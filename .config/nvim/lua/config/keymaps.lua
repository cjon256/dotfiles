-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set
-- local delkey = vim.keymap.del

-- -----------------------------------------------------------------------------
-- First the default keymaps from LazyVim
-- better up/down
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
keymap({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
-- keymap("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
-- keymap("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
-- keymap("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
-- keymap("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
keymap("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
keymap("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
keymap("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
keymap("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })
-- vim.keymap.set("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { silent = true })
-- vim.keymap.set("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNavigateNext<CR>", { silent = true })

-- Resize window using <ctrl> arrow keys
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- -- Move Lines
-- map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
-- map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
-- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
-- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
-- map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
-- map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
--
-- -- buffers
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap("n", "<leader>nb", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
keymap("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
keymap("n", "<leader>bd", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
keymap("n", "<leader>bo", function()
  Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
keymap("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- -- Clear search with <esc>
-- map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })
--
-- -- Clear search, diff update and redraw
-- -- taken from runtime/lua/_editor.lua
-- map(
--   "n",
--   "<leader>ur",
--   "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--   { desc = "Redraw / Clear hlsearch / Diff Update" }
-- )
--
-- -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
keymap("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
keymap("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
keymap("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
keymap("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
keymap("i", ",", ",<c-g>u")
keymap("i", ".", ".<c-g>u")
keymap("i", ";", ";<c-g>u")

-- -- save file
-- map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
--
-- --keywordprg
-- map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- -- commenting
-- map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
-- map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })
--
-- -- lazy
-- map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
keymap("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

keymap("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
keymap("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

keymap("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
keymap("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })
keymap("n", "<leader>nq", vim.cmd.cnext, { desc = "Next Quickfix" })

-- formatting
keymap({ "n", "v" }, "<leader>cf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
keymap("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
keymap("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
keymap("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
keymap("n", "<leader>nd", diagnostic_goto(true), { desc = "Next Diagnostic" })
keymap("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
keymap("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
keymap("n", "<leader>ne", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
keymap("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
keymap("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
keymap("n", "<leader>nw", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })

-- stylua: ignore start

-- toggle options
LazyVim.format.snacks_toggle():map("<leader>uf")
LazyVim.format.snacks_toggle(true):map("<leader>uF")
-- Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
-- Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
-- Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
Snacks.toggle.diagnostics():map("<leader>ud")
Snacks.toggle.line_number():map("<leader>ul")
Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }):map("<leader>uc")
Snacks.toggle.option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" }):map("<leader>uA")
Snacks.toggle.treesitter():map("<leader>uT")
-- Snacks.toggle.option("background", { off = "light", on = "dark" , name = "Dark Background" }):map("<leader>ub")
Snacks.toggle.dim():map("<leader>uD")
-- Snacks.toggle.animate():map("<leader>ua")
-- Snacks.toggle.indent():map("<leader>ug")
-- Snacks.toggle.scroll():map("<leader>uS")
-- Snacks.toggle.profiler():map("<leader>dpp")
-- Snacks.toggle.profiler_highlights():map("<leader>dph")

-- if vim.lsp.inlay_hint then
--   Snacks.toggle.inlay_hints():map("<leader>uh")
-- end

-- -- lazygit
-- if vim.fn.executable("lazygit") == 1 then
--   map("n", "<leader>gg", function() Snacks.lazygit( { cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
--   map("n", "<leader>gG", function() Snacks.lazygit() end, { desc = "Lazygit (cwd)" })
--   map("n", "<leader>gf", function() Snacks.lazygit.log_file() end, { desc = "Lazygit Current File History" })
--   map("n", "<leader>gl", function() Snacks.lazygit.log({ cwd = LazyVim.root.git() }) end, { desc = "Lazygit Log" })
--   map("n", "<leader>gL", function() Snacks.lazygit.log() end, { desc = "Lazygit Log (cwd)" })
-- end

 keymap("n", "<leader>gb", function() Snacks.git.blame_line() end, { desc = "Git Blame Line" })
 keymap({ "n", "x" }, "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse (open)" })
 -- keymap({"n", "x" }, "<leader>gY", function()
 --   Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false })
 -- end, { desc = "Git Browse (copy)" })

-- -- quit
-- map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
--
-- -- highlights under cursor
-- map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
-- map("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })
--
-- -- LazyVim Changelog
-- map("n", "<leader>L", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })
--
-- -- floating terminal
-- map("n", "<leader>fT", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
-- map("n", "<leader>ft", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
-- map("n", "<c-/>",      function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
-- map("n", "<c-_>",      function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "which_key_ignore" })
--
-- -- Terminal Mappings
-- map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
--
-- -- windows
-- map("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
-- map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
-- map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
-- map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
-- Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
-- Snacks.toggle.zen():map("<leader>uz")
--
-- -- tabs
-- map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
-- map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
-- map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
-- map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
-- map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
-- map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
--

-- -----------------------------------------------------------------------------
-- Now we can add our own keymaps
keymap("n", "<leader>z", "<CMD>w<CR>", { desc = "Write file" })
keymap("n", "<leader><leader>z", "<CMD>wa<CR>", { desc = "Write file" })
keymap("n", "<leader>ww", ":w<CR>", { desc = "Write file" })
keymap("n", "<leader>wa", ":wa<CR>", { desc = "Write all files" })
keymap("n", "<leader>wz", ":wqa<CR>", { desc = "Write quit all" })
keymap("n", "<leader>qq", ":q<CR>", { desc = "Quit (current buffer)" })
keymap("n", "<leader>aq", ":qa<CR>", { desc = "Quit all" })
keymap("n", "<leader>qa", ":qa<CR>", { desc = "Quit all" })

-- keymap("n", "<leader>bb", ":buffers<CR>:buffer<Space>", { desc = "Switch buffer listing" })
-- keymap("n", "<leader>bd", ":buffers<CR>:bdelete<Space>", { desc = "Delete buffer listing" })
keymap("n", "<leader>f6", "<CMD>b#<cr>", { desc = "Switch to previous buffer" })

-- keymap('n', '<leader>ee', '<CMD>Ex<CR>', { desc = 'Ex mode' })

keymap("n", "<leader>tr", "<CMD>Trouble diagnostics toggle<CR>", { desc = "Toggle trouble" })
-- keymap("n", "<C-h><C-h>", "<CMD>Trouble diagnostics toggle<CR>", { desc = "Trouble Toggle" })

keymap("n", "<leader>ut", ":UndotreeToggle<CR>", { desc = "Toggle undotree" })
keymap("n", "<leader>so", ":SymbolsOutline<CR>", { desc = "Toggle symbols outline" })

-- keymap("n", "<C-t><C-f>", "<CMD>lua require('toggleterm').toggle(3, 70, vim.loop.cwd(), 'float')<CR>", { desc = "Toggle terminal vertical" })
-- keymap("n", "<leader>tt", "<CMD>lua require('toggleterm').toggle(1, 15, vim.loop.cwd(), 'horizontal')<CR>", { desc = "Toggle terminal horizontal" })
keymap('n', "<C-h><C-h>", function()
    local count = vim.v.count1
    require("toggleterm").toggle(count, 70, vim.fn.getcwd(), "float")
  end, { desc = "ToggleTerm (float)" })
keymap("n", "<C-t><C-t>", "<CMD>lua require('toggleterm').toggle(11, vim.o.columns * 0.4, vim.loop.cwd(), 'vertical')<CR>", { desc = "Toggle terminal vertical" })
keymap("n", "<C-n><C-n>", "<CMD>lua require('toggleterm').toggle(12, 15, vim.loop.cwd(), 'horizontal')<CR>", { desc = "Toggle terminal horizontal" })

-- keymap("t", "<C-t>w", "<CMD>vertical resize 200<CR>", { desc = "Set term width to 200" })
keymap("t", "<C-h><C-h>", "<CMD>ToggleTerm<CR>", { desc = "Toggle terminal (terminal mode)" })
keymap("t", "<C-t><C-t>", "<CMD>ToggleTerm<CR>", { desc = "Toggle terminal (terminal mode)" })
keymap("t", "<C-n><C-n>", "<CMD>ToggleTerm<CR>", { desc = "Toggle terminal (terminal mode)" })
keymap("t", "<C-t><Esc>", "<C-\\><C-n>", { desc = "Exit terminal (terminal mode)" })
keymap("t", "<C-t><C-c>", "<C-\\><C-n>", { desc = "Exit terminal (terminal mode)" })
keymap("t", "<C-t><C-w>", "<C-\\><C-n><C-w><C-w>", { desc = "Move to other pane (terminal mode)" })

keymap('n', "<leader>Tn", "<cmd>ToggleTermSetName<cr>", { desc = "Set term name" })
keymap('n', "<leader>Ts", "<cmd>TermSelect<cr>", { desc = "Select term" })
keymap('n', "<leader>Tf", function()
    local count = vim.v.count1
    require("toggleterm").toggle(count, 0, LazyVim.root.get(), "float")
  end, { desc = "ToggleTerm (float root_dir)" })
keymap('n', "<leader>Th", function()
    local count = vim.v.count1
    require("toggleterm").toggle(count, 15, LazyVim.root.get(), "horizontal")
  end, { desc = "ToggleTerm (horizontal root_dir)" })
keymap('n', "<leader>Tv", function()
    local count = vim.v.count1
    require("toggleterm").toggle(count, vim.o.columns * 0.4, LazyVim.root.get(), "vertical")
  end, { desc = "ToggleTerm (vertical root_dir)" })
keymap('n', "<leader>Tt", function()
    require("toggleterm").toggle(1, 100, LazyVim.root.get(), "tab")
  end, { desc = "ToggleTerm (tab root_dir)" })
keymap('n', "<leader>TT",
  function()
    require("toggleterm").toggle(1, 100, vim.fn.getcwd(), "tab")
 end, { desc = "ToggleTerm (tab cwd_dir)" })

--  for anki
keymap('v', '<leader>cc', 'c{{c1::<C-r>"}}<Esc>', { noremap = true, desc = 'Wrap visual selection with {{c1::}}' })


keymap(
  "t",
  "<C-t><C-k>",
  "<CMD>exe 'resize ' . (winheight(0) * 3/2)<CR>",
  { desc = "Enlarge terminal height (terminal mode)" }
)
keymap(
  "t",
  "<C-t><C-h>",
  "<CMD>exe 'vert resize ' . (winwidth(0) * 3/2)<CR>",
  { desc = "Enlarge terminal width (terminal mode)" }
)
keymap(
  "t",
  "<C-t><C-l>",
  "<CMD>exe 'vert resize ' . (winwidth(0) * 2/3)<CR>",
  { desc = "Shrink terminal width (terminal mode)" }
)
keymap(
  "t",
  "<C-t><C-j>",
  "<CMD>exe 'resize ' . (winheight(0) * 2/3)<CR>",
  { desc = "Shrink terminal height (terminal mode)" }
)

keymap("n", "<leader>p", "<cmd>Pounce<cr>", { desc = "Pounce..." })
keymap("n", "<leader><leader>p", "<cmd>PounceRepeat<cr>", { desc = "Pounce Again..." })

keymap("n", "<leader>oo", "<CMD>Oil<CR>", { desc = "Open oil" })

-- ThePrimeagen greatest hits
-- greatest remap ever
keymap("x", "<leader>P", [["_dP]], { desc = "Paste over selection" })

-- next greatest remap ever : asbjornHaland
keymap({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
keymap("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })
keymap({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to blackhole register" })

keymap("n", "Y", "yg$", { desc = "Yank to end of line" })

--  Prime's nice "keep it centered" stuff
keymap("n", "n", "nzzzv", { desc = "Move to next search match (centered)" })
keymap("n", "N", "Nzzzv", { desc = "Move to previous search match (centered)" })
keymap("n", "J", "Jzz", { desc = "Join lines (centered)" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Move down half a page (centered)" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Move up half a page (centered)" })

-- Primeagen: "This is going to get me cancelled"
-- keymap("i", "<C-c>", "<Esc>")
-- cjon: decided not to use this

-- keymap('n', 'Q', '<nop>', { desc = 'Disable accidently going into Ex mode' })
-- keymap('n', 'q:', '<nop>', { desc = 'Disable accidently going into Ex list mode' })
keymap("n", "<leader>bf", "<CMD>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open tmux-sessionizer" })

keymap("n", "<leader>gC", "<Cmd>FzfLua git_commits<CR>", { desc = "Browse Commits" })

keymap("n", "<leader>gg", "<CMD>Git<CR>", { desc = "Git status" })
keymap("n", "<leader>gc", "<CMD>Git commit -v<CR>", { desc = "Git commit -v" })
keymap("n", "<leader>gd", "<CMD>Gvdiffsplit<CR>", { desc = "Git diffsplit vertical" })
keymap("n", "<leader>gp", "<CMD>Git pull<CR>", { desc = "Git diffsplit horizontal" })
keymap("n", "<leader>gP", "<CMD>Git push<CR>", { desc = "Git push" })
keymap("n", "<leader>ga", "<CMD>Git add %<CR>", { desc = "Git add current file" })
local log_format = "--pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
keymap("n", "<leader>gll", "<CMD>Git log<CR>", { desc = "Git log" })
keymap("n", "<leader>gld", "<CMD>Git log -p %<CR>", { desc = "Git log detailed" })
keymap(
  "n",
  "<leader>glr",
  "<CMD>Git log --graph " .. log_format .. " --abbrev-commit --date=relative<CR>",
  { desc = "Git log relative" }
)
keymap("n", "<leader>gq", "<CMD>$quit<CR>", { desc = "Close current split" })

keymap("n", "<leader><leader>a", function()
  require("harpoon"):list():add()
end, { desc = "Mark file with Harpoon" })
keymap("n", "<leader><leader>m", function()
  local harpoon = require("harpoon")
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Show Harpoon" })
--
keymap("n", "<leader><leader>d", function()
  require("harpoon"):list():select(1)
end, { desc = "Harpoon File 1" })
keymap("n", "<leader><leader>h", function()
  require("harpoon"):list():select(2)
end, { desc = "Harpoon File 2" })
keymap("n", "<leader><leader>t", function()
  require("harpoon"):list():select(3)
end, { desc = "Harpoon File 3" })
keymap("n", "<leader><leader>n", function()
  require("harpoon"):list():select(4)
end, { desc = "Harpoon File 4" })
keymap("n", "<leader><leader>s", function()
  require("harpoon"):list():select(5)
end, { desc = "Harpoon File 5" })
--
-- -- Toggle previous & next buffers stored within Harpoon list
keymap("n", "<C-S-P>", function()
  require("harpoon"):list():prev()
end)
keymap("n", "<C-S-N>", function()
  require("harpoon"):list():next()
end)

-- Native Macos paste/copy for Neovide
if vim.g.neovide then
  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<C-O>"+P<CR>') -- Paste insert mode
  vim.o.guifont = "Menlo:h19"
  vim.opt.wrap = true
end

vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    vim.opt.cmdheight = 1
  end,
})
vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    vim.opt.cmdheight = 0
  end,
})
