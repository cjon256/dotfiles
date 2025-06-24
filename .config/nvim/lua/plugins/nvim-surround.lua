return {
  {
    -- disable mini.surround, don't need both
    "echasnovski/mini.surround",
    enabled = false,
  },

  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
        keymaps = {
          insert = "g<C-g>s",
          insert_line = "g<C-g>S",
          normal = "gsy",
          normal_cur = "gsys",
          normal_line = "gSy",
          normal_cur_line = "gSyS",
          visual = "gS",
          visual_line = "gSS",
          delete = "gsd",
          change = "gsc",
          change_line = "gSc",
        },
      })
    end,
  },
}
