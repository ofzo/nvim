return {
    "catppuccin/nvim",
    name = "catppuccin",
    dependencies = {
        "ofzo/palette",
    },
    opts = {
        -- configuration options...
        flavour = "auto",
        -- color_overrides = {
        --     all = {
        --         text = "#1f2937",
        --     },
        -- },
        transparent_background = true,
        custom_highlights = function()
            local color = require "palette"
            return {
                Normal = { fg = color.black },
                NeoTreeRootName = { fg = color.gray300 },
                NeoTreeWinSeparator = { fg = color.white },
                NeoTreeDirectoryName = { fg = color.gray800 },
                NeotreeFileName = { fg = color.black },
                NotifyBackground = { bg = color.gray300 },
                CursorLineNr = { fg = color.fuchsia500, style = { "bold" } },
                CursorLine = { bg = color.sky100 },
                Pmenu = { bg = color.white, fg = color.gray800 },
                PmenuSel = { bg = color.sky100, fg = color.red600 },
                Visual = { bg = color.red100, style = {} },
                LspReferenceRead = { bg = color.lime100 },
                UfoFoldedEllipsis = { fg = color.lime600, bg = color.lime100 },
                Function = { fg = color.violet600 },
                Include = { fg = color.fuchsia600, style = {} },
                IndentLineCurrent = { fg = color.gray200 },
                IndentLine = { fg = color.gray200 },

                TodoBgFIX = { bg = color.white },
                TodoBgNOTE = { bg = color.white },
                TodoBgHACK = { bg = color.white },
                TodoBgTODO = { bg = color.white },
                TodoBgWARN = { bg = color.white },
                TodoBgPERF = { bg = color.white },
                TodoBgTEST = { bg = color.white },

                Cursor = { bg = color.sky200, style = {} },
                lCursor = { bg = color.sky200, style = {} },
                CursorIM = { bg = color.sky200 },
                MultipleCursorsCursor = { bg = color.sky200 },
                MultipleCursoesCursor = { bg = color.sky200 },
                ----

                DiagnosticUnderlineError = { bg = color.red50, style = {} },
                DiagnosticUnderlineWraning = { bg = color.yellow50, style = {} },

                ["@field"] = { fg = color.rose600 },
                ["@property"] = { fg = color.red600 },
                ["@number"] = { fg = color.fuchsia600, style = { "bold" } },
                ["@boolean"] = { fg = color.fuchsia600 },
                ["@keyword"] = { fg = color.fuchsia600, style = {} },
                ["@keyword.function"] = {
                    fg = color.purple600,
                    style = { "italic" },
                },
                ["@function.macro"] = {
                    fg = color.rose600,
                    style = { "italic" },
                },
                ["@function.builtin.lua"] = { fg = color.purple600, style = { "italic" } },
                ["@keyword.coroutine.rust"] = {
                    fg = color.fuchsia600,
                },
                ["@variable.member"] = { fg = color.gray800 },
                ["@method.call"] = { style = { "italic" } },
                ["@module"] = { fg = color.gray800 },

                WhichKeyDesc = { fg = color.gray800 },
            }
        end,
        integrations = {
            notify = false,
            cmp = false,
            dap = false,
            dap_ui = false,
            ufo = false,
            dashboard = false,
            alpha = false,
            mini = false,
            neogit = false,
            nvimtree = false,
            semantic_tokens = false,
            treesitter = false,
            treesitter_context = false,
            illuminate = false,
        },
    },
}
