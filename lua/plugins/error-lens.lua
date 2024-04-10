-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
    "chikko80/error-lens.nvim",
    event = "BufRead",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    enabled = false,
    opts = {
        -- your options go here
        prefix = 8,
        colors = {
            error_fg = "#dc2626", -- diagnostic font color
            error_bg = "#fef2f2", -- diagnostic line color
            warn_fg = "#f59e0b",
            warn_bg = "#fef9c3",
            info_fg = "#52525b",
            -- info_bg = "white",
            hint_fg = "#c026d3",
            hint_bg = "#fae8ff",
        },
    },
}
