return {
  -- add night-owl
  {
    "haishanh/night-owl.vim",
  },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

  -- Configure LazyVim to load night-owl
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "moonfly",
    },
  },
}
