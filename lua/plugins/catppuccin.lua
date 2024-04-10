return {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
        -- configuration options...
        flavour = "auto",
        color_overrides = {
            all = {
                text = "#1f2937",
            },
        },
        transparent_background = true,
        custom_highlights = function()
            return {
                -- NormalFloat = { bg = "#fafafa" },
                NeoTreeWinSeparator = { fg = "#e0f2fe" },
                NotifyBackground = { bg = "#fafafa" },
                CursorLineNr = { fg = "#a21caf", style = { "bold" } },
                CursorLine = { bg = "#e0f2fe" },
                IndentBlanklineContextChar = { fg = "#cbd5e1" },
                IblIndent = { fg = "white" },
                IblWhitespace = { fg = "white" },
                IblScope = { fg = "#ccd0da" },
                Pmenu = { bg = "white", fg = "#111827" },
                PmenuSel = { bg = "#fecdd3", fg = "#e11d48" },
                Visual = { bg = "#fecdd3" },
                UfoFoldedEllipsis = { fg = "#84cc16", bg = "#e0f2fe" },
                ["@field"] = { fg = "#e11d48" },
                ["@property"] = { fg = "#c2410c" },
                ["@number"] = { fg = "#a21caf", style = { "bold" } },
                ["@boolean"] = { fg = "#a21caf", style = { "bold" } },
                ["@keyword.function"] = {
                    fg = "#a21caf",
                    style = { "italic" },
                },
                ["@function.macro"] = {
                    fg = "#a21caf",
                    style = { "italic" },
                },
                ["@method.call"] = { style = { "italic" } },
            }
        end,
        integrations = {
            notify = true,
        },
    },
}
