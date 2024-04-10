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
                -- last = true, -- auto save last session
                -- cwd = true, -- auto save session for each working directory
            },
            -- Patterns to ignore when saving sessions
            ignore = {
                dirs = {}, -- working directories to ignore sessions in
                filetypes = { "gitcommit", "gitrebase" }, -- filetypes to ignore sessions
                buftypes = {}, -- buffer types to ignore sessions
            },
        },
        autocmds = {
            CmpSourceCargo = {
                {
                    event = "BufRead",
                    desc = "Load crates.nvim into Cargo buffers",
                    pattern = "Cargo.toml",
                    callback = function()
                        require("cmp").setup.buffer { sources = { { name = "crates" } } }
                        require "crates"
                    end,
                },
            },
        },
        -- Configure core features of AstroNvim
        features = {
            large_buf = { size = 1024 * 500, lines = 1000 }, -- set global limits for large files for disabling features like treesitter
            autopairs = true, -- enable autopairs at start
            cmp = true, -- enable completion at start
            diagnostics_mode = 2, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
            highlighturl = true, -- highlight URLs at start
            notifications = false, -- enable notifications at start
        },
        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
            virtual_text = true,
            underline = false,
            update_in_insert = false,
        },
        -- vim options can be configured here
        options = {
            opt = { -- vim.opt.<key>
                relativenumber = false, -- sets vim.opt.relativenumber
                spell = false, -- sets vim.opt.spell
                signcolumn = "yes", -- sets vim.opt.signcolumn to auto
                showtabline = 0,
                guicursor = "n-v-c:blinkon0,i-ci:ver25,r-cr:hor20,o:hor50",
                -- cmdheight = 1, -- 0 = remove command line
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

                x = { function() vim.api.nvim_feedkeys("V", "n", false) end },
                q = {
                    function() vim.api.nvim_command "close" end,
                },
                -- mappings seen under group name "Buffer"
                ["<C-s>"] = { function() vim.cmd "write" end, desc = "Save File" }, -- change description but the same command
                ["<S-s>"] = { function() vim.cmd "write" end, desc = "Save File" }, -- change description but the same command
                ["<C-p>"] = {
                    function() vim.cmd.Telescope "keymaps" end,
                    desc = "Command plane",
                },
                ["<leader>f"] = {
                    function() vim.cmd.Telescope "find_files" end,
                    desc = "file picker",
                },
                ["<leader>w"] = {
                    function() vim.cmd.Telescope "live_grep" end,
                    desc = "Live grep",
                },
                ["<leader>s"] = {
                    -- brew install serpl ast-grep
                    function() require("astrocore").toggle_term_cmd { cmd = "serpl", direction = "float" } end,
                    desc = "Search & Replace",
                },
            },
            v = {
                x = { function() vim.api.nvim_feedkeys("j", "n", false) end },
                X = { function() vim.api.nvim_feedkeys("k", "n", false) end },
                q = { function() vim.api.nvim_command "close" end },
            },
        },
    },
}
