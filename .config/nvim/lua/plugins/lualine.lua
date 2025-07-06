local function listed_buffer_count()
  local total_buffers = 0
  local dirty_buffers = 0

  -- Loop through all buffers
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    -- We only care about listed buffers
    if vim.bo[bufnr].buflisted then
      total_buffers = total_buffers + 1
      -- If it's listed, check if it's also modified
      if vim.bo[bufnr].modified then
        dirty_buffers = dirty_buffers + 1
      end
    end
  end

  if total_buffers <= 1 then
    return ""
  end

  local total_str = string.format("[%d", total_buffers)

  -- If there are dirty buffers, append that info
  --
  if dirty_buffers > 0 then
    -- The '' is a pencil icon (nf-fa-pencil)
    local dirty_str = string.format("  %d]", dirty_buffers)
    return total_str .. dirty_str
  end

  -- Otherwise, just return the total count
  return total_str .. "]"
end

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      sections = {
        lualine_c = {
          LazyVim.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = LazyVim.config.icons.diagnostics.Error,
              warn = LazyVim.config.icons.diagnostics.Warn,
              info = LazyVim.config.icons.diagnostics.Info,
              hint = LazyVim.config.icons.diagnostics.Hint,
            },
          },

          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path({ modified_sign = "●" }), separator = "" },
          { listed_buffer_count },

          -- { "buffers", mode = 2, symbols = { modified = "●" } },
        },
      },
    },
  },
}
