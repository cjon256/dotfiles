return {
  "purarue/yadm-git.vim",
  event = "BufWinEnter",
  config = function()
    vim.g.yadm_git_fugitive_enabled = 1
    vim.g.yadm_git_gitgutter_enabled = 0
  end,
}
