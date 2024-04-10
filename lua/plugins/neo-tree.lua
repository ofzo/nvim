return {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
        {
            "<leader>e",
            function() vim.cmd.Neotree "reveal" end,
            desc = "Toggle Explorer Focus",
        },
        {
            "<leader>ge",
            function() vim.cmd.Neotree("float", "git_status") end,
            desc = "Show Git Status",
        },
    },
    opts = function()
        local get_icon = require("astroui").get_icon
        return {
            auto_clean_after_session_restore = true,
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            -- sources = { "filesystem", "git_status" },
            -- source_selector = {
            --     winbar = true,
            --     content_layout = "center",
            --     sources = {
            --         { source = "filesystem", display_name = get_icon("FolderClosed", 1, true) .. "File" },
            --         -- { source = "buffers", display_name = get_icon("DefaultFile", 1, true) .. "Bufs" },
            --         { source = "git_status", display_name = get_icon("Git", 1, true) .. "Git" },
            --         -- { source = "diagnostics", display_name = get_icon("Diagnostic", 1, true) .. "Diagnostic" },
            --     },
            -- },
            window = {
                width = 40,
            },
            filesystem = {
                filtered_items = {
                    hide_by_name = {
                        "node_modules",
                    },
                    hide_dotfiles = true,
                    hide_gitignored = true,
                    never_show = { ".DS_Store" },
                },
                follow_current_file = { enable = true },
            },
            default_component_configs = {
                indent = {
                    padding = 0,
                    -- indent_marker = " ",
                    with_markers = false,
                    expander_collapsed = " ",
                    expander_expanded = " ",
                },
                icon = {
                    folder_closed = get_icon "FolderClosed",
                    folder_open = get_icon "FolderOpen",
                    folder_empty = get_icon "FolderEmpty",
                    folder_empty_open = get_icon "FolderEmpty",
                    default = get_icon "DefaultFile",
                },
                modified = { symbol = get_icon "FileModified" },
                git_status = {
                    symbols = {
                        added = get_icon "GitAdd",
                        deleted = get_icon "GitDelete",
                        modified = get_icon "GitChange",
                        renamed = get_icon "GitRenamed",
                        untracked = get_icon "GitUntracked",
                        ignored = get_icon "GitIgnored",
                        unstaged = get_icon "GitUnstaged",
                        staged = get_icon "GitStaged",
                        conflict = get_icon "GitConflict",
                    },
                },
            },
        }
    end,
}
