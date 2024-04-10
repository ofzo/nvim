return {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = function()
        local get_icon = require("astroui").get_icon

        return {
            -- add any options here
            cmdline = {
                view = "cmdline",
                format = {
                    cmdline = { icon = ":" },
                    search_down = { icon = get_icon "Search" },
                    filter = { icon = "$" },
                    lua = { icon = "☾" },
                    help = { icon = "?" },
                },
            },
            messages = { enabled = false },
            popupmenu = {
                backend = "cmp",
            },
            lsp = {
                progress = {
                    enabled = false,
                },
                override = {
                    -- override the default lsp markdown formatter with Noice
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                    -- override the lsp markdown formatter with Noice
                    ["vim.lsp.util.stylize_markdown"] = false,
                    -- override cmp documentation with Noice (needs the other options to work)
                    ["cmp.entry.get_documentation"] = false,
                },
                hover = { enabled = false },
                signature = { enabled = false },
                documentation = { enabled = false },
            },
            presets = {
                command_palette = true,
                inc_rename = true,
                lsp_doc_border = true,
                long_message_to_split = false, -- long messages will be sent to a split
            },
            views = {
                popupmenu = {
                    relative = "editor",
                    position = {
                        row = 10,
                        col = "50%",
                    },
                    scrollbar = true,
                    size = {
                        width = 80,
                        height = "auto",
                    },
                    border = {
                        style = "rounded",
                        padding = { 0, 1 },
                    },
                },
            },
        }
    end,
}
