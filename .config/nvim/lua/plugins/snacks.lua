return {
  {
    "folke/snacks.nvim",
    opts = {
      indent = { enabled = false },
      statuscolumn = {
        left = { "git", "mark", "sign" }, -- priority of signs on the left (high to low)
        right = { "fold" }, -- priority of signs on the right (high to low)
        -- folds = {
        --   open = false, -- show open fold icons
        --   git_hl = false, -- use Git Signs hl for fold icons
        -- },
        -- git = {
        --   -- patterns to match Git signs
        --   patterns = { "GitSign", "MiniDiffSign" },
        -- },
        -- refresh = 50, -- refresh at most every 50ms
      },
    },
  },
  {
    "snacks.nvim",
    opts = {
      indent = { enabled = false }, -- default was true
      input = { enabled = true },
      notifier = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = false }, -- we set this in options.lua
      toggle = { map = LazyVim.safe_keymap_set },
      words = { enabled = true },
    },
    -- stylua: ignore
    keys = {
      { "<leader>nn", function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>nd", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    },
  },
}
