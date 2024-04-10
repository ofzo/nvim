-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
        sessions = {
            -- Configure auto saving
            autosave = {
                last = true, -- auto save last session
                cwd = true, -- auto save session for each working directory
            },
            -- Patterns to ignore when saving sessions
            ignore = {
                dirs = {}, -- working directories to ignore sessions in
                filetypes = { "gitcommit", "gitrebase" }, -- filetypes to ignore sessions
                buftypes = {}, -- buffer types to ignore sessions
            },
        },
        -- Configure core features of AstroNvim
        features = {
            large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
            autopairs = true, -- enable autopairs at start
            cmp = true, -- enable completion at start
            diagnostics_mode = 1, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
            highlighturl = true, -- highlight URLs at start
            notifications = false, -- enable notifications at start
        },
        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
            virtual_text = true,
            underline = false,
        },
        -- vim options can be configured here
        options = {
            opt = { -- vim.opt.<key>
                relativenumber = false, -- sets vim.opt.relativenumber
                spell = false, -- sets vim.opt.spell
                signcolumn = "auto", -- sets vim.opt.signcolumn to auto
                showtabline = 0,
            },
            g = { -- vim.g.<key>
                -- configure global vim variables (vim.g)preserveindent = true, preserveindent = true,
                -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
                -- This can be found in the `lua/lazy_setup.lua` file
                ui_notifications_enabled = false,
            },
        },
        -- Mappings can be configured through AstroCore as well.
        -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
        mappings = {
            -- first key is the mode
            n = {
                -- second key is the lefthand side of the map
                -- navigate buffer tabs with `H` and `L`

                -- mappings seen under group name "Buffer"
                ["<Leader>bD"] = {
                    function()
                        require("astroui.status.heirline").buffer_picker(
                            function(bufnr) require("astrocore.buffer").close(bufnr) end
                        )
                    end,
                    desc = "Pick to close",
                },
                -- tables with just a `desc` key will be registered with which-key if it's installed
                -- this is useful for naming menus
                -- quick save
                ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
            },
            t = {
                -- setting a mapping to false will disable it
                -- ["<esc>"] = false,
            },
        },
    },
}
