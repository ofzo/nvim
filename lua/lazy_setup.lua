require("lazy").setup({
    {
        "AstroNvim/AstroNvim",
        version = "^4",           -- Remove version tracking to elect for nighly AstroNvim
        import = "astronvim.plugins",
        opts = {                  -- AstroNvim options must be set here with the `import` key
            mapleader = " ",      -- This ensures the leader key must be configured before Lazy is set up
            maplocalleader = ",", -- This ensures the localleader key must be configured before Lazy is set up
            icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
            pin_plugins = nil,    -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
        },
    },
    { import = "community" },
    { import = "plugins" },
} --[[@as LazySpec]], {
    -- Configure any other `lazy.nvim` configuration options here
    -- install = { colorscheme = { "astrodark", "habamax" } },
    ui = { size = { width = 0.7, height = 0.7 }, border = "rounded" },
    checker = { enabled = false },
    change_detection = {
        enabled = false,
        notify = false,
    },
    git = {
        url_format = vim.env.GITHUB,
        log = { "-2" }, -- show the last 8 commits
    },
    performance = {
        cache = {
            enabled = true,
        },
        rtp = {
            -- disable some rtp plugins, add more to your liking
            disabled_plugins = {
                "gzip",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "zipPlugin",
            },
        },
    },
} --[[@as LazyConfig]])
