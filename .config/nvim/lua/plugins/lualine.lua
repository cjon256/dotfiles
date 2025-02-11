return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_c, {
        function()
          if vim.api.nvim_get_option_value("modified", {}) then
            return "+" -- any message or icon
          end
          return ""
        end,
      })
    end,
  },
}
