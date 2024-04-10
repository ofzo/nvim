return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "gbrlsnchs/telescope-lsp-handlers.nvim"
  },
  event = "VeryLazy",
  opts = {
    defaults = {
      file_ignore_patterns = { "^%.git[/\\]", "[/\\]%.git[/\\]" },
      git_worktrees = require("astrocore").config.git_worktrees,
      path_display = { "truncate" },
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = { prompt_position = "bottom", preview_width = 0.55 },
        vertical = { mirror = false },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      -- other defaults configuration here
    },
  },
  config = function()
    require('telescope').load_extension("lsp_handlers")
  end
}
