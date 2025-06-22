return {
  "gbprod/yanky.nvim",
  opts = {
    highlight = { timer = 150 },
    system_clipboard = {
      sync_with_ring = false,
      clipboard_register = nil,
    },
  },
  keys = {
    {
      "<leader>sp",
      function()
        if LazyVim.pick.picker.name == "telescope" then
          require("telescope").extensions.yank_history.yank_history({})
        else
          vim.cmd([[YankyRingHistory]])
        end
      end,
      mode = { "n", "x" },
      desc = "Yank History",
    },
        -- stylua: ignore
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
  },
}
