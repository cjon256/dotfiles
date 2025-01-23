return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
    {
      -- XXX unfortunately, this interferes with gitsigns...
      "purarue/gitsigns-yadm.nvim",
      lazy = true,
      opts = {
        shell_timeout_ms = 1000,
      },
    },
  },
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- signcolumn = false,
    signs = {
      add = { text = "+" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "ɫ" },
      untracked = { text = "┆" },
    },
    _on_attach_pre = function(_, callback)
      require("gitsigns-yadm").yadm_signs(callback)
    end,
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function keymap(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      keymap("n", "<leader>nc", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "Next hunk {gitsigns}" })
      keymap("n", "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "Next hunk {gitsigns}" })

      keymap("n", "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "Previous hunk {gitsigns}" })

      -- Actions
      keymap("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk {gitsigns}" })
      keymap("v", "<leader>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end)
      keymap("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk {gitsigns}" })
      keymap("v", "<leader>hr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end)
      keymap("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer {gitsigns}" })
      keymap("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk {gitsigns}" })
      keymap("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer {gitsigns}" })
      keymap("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk {gitsigns}" })
      keymap("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, { desc = "Show full blame line {gitsigns}" })
      keymap("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle current line blame {gitsigns}" })
      keymap("n", "<leader>hd", gs.diffthis, { desc = "Diff this {gitsigns}" })
      -- map('n', '<leader>hD', function()
      --     gs.diffthis '~'
      -- end)
      keymap("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle deleted {gitsigns}" })
      -- Text object
      keymap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk {gitsigns}" })
    end,
  },
}
