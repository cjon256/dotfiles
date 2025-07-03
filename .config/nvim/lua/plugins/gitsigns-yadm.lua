return {
  "purarue/gitsigns-yadm.nvim",
  dependencies = { "lewis6991/gitsigns.nvim" },
  config = function()
    require("gitsigns-yadm").setup({
      opts = {
        shell_timeout_ms = 1000,
      },
    })
  end,
}
