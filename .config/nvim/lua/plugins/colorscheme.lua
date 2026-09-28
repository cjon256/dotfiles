return {
  -- add night-owl
  {
    "haishanh/night-owl.vim",
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        -- ...
      })

      -- vim.cmd("colorscheme github_dark_high_contrast")
    end,
  },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

  {
    "lucasprag/simpleblack",
  },

  {
    "JChouCode/mustard",
  },

  -- Tell LazyVim to the active colorscheme
  {
    -- mustard sets more complete colors
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "mustard",
    },
  },
  {
    -- but I prefer simpleblack's basic colors
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "simpleblack",
    },
  },
}
