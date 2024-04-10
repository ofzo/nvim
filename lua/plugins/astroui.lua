-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
        -- change colorscheme
        -- colorscheme = "onelight",
        colorscheme = "catppuccin",
        -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
        highlights = {
            init = { -- this table overrides highlights in all themes
                -- Normal = { bg = "white" },
            },
        },
        -- Icons can be configured throughout the interface
        icons = {
            ActiveLSP = "",
            ActiveTS = " ",
            BufferClose = "",
            DapBreakpoint = "",
            DapBreakpointCondition = "",
            DapBreakpointRejected = "",
            DapLogPoint = "",
            DapStopped = "",
            DefaultFile = "",
            Diagnostic = "",
            DiagnosticError = "",
            DiagnosticHint = "",
            DiagnosticInfo = "",
            DiagnosticWarn = "",
            Ellipsis = "",
            FileModified = "",
            FileReadOnly = "",
            FoldClosed = "",
            FoldOpened = "",
            FolderClosed = "",
            FolderEmpty = "",
            FolderOpen = "",
            Git = "",
            GitAdd = "",
            GitBranch = "",
            GitChange = "",
            GitConflict = "",
            GitDelete = "",
            GitIgnored = "",
            GitRenamed = "",
            GitStaged = "",
            GitUnstaged = "",
            GitUntracked = "",
            LSPLoaded = "",
            LSPLoading1 = "",
            LSPLoading2 = "",
            LSPLoading3 = "",
            MacroRecording = "",
            Paste = "",
            Search = "",
            Selected = "",
            TabClose = "",
        },
    },
}
