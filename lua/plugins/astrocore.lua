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
                dirs = {},                                -- working directories to ignore sessions in
                filetypes = { "gitcommit", "gitrebase" }, -- filetypes to ignore sessions
                buftypes = {},                            -- buffer types to ignore sessions
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
            Normal = {
                {
                    event = "ModeChanged",
                    desc = "set cursor line background",
                    callback = function()
                        local color = require "palette"

                        local mode = vim.api.nvim_get_mode();
                        local str = string.format("%s", mode.mode);
                        -- print("mode", str);
                        local background = {
                            i = { bg = color.green100 },  -- Insert mode
                            r = { bg = color.green100 },  -- Replace mode
                            ci = { bg = color.green100 }, -- Command-line Insert mode
                            cr = { bg = color.green100 }, -- Command-line Replace mode
                            n = { bg = color.sky100 },    -- Normal mode
                            sm = { bg = color.sky100 },   -- showmatch in Insert mode
                            v = { bg = color.sky100 },    -- Visual mode
                            ve = { bg = color.sky100 },   -- Visual mode with 'selection' "exclusive" (same as 'v', if not specified)
                            V = { bg = color.sky100 },    --  Visual Line mode
                            c = { bg = color.white },     -- Command-line Normal (append) mode
                            o = { bg = color.white },     -- Operator-pending mode
                            no = { bg = color.white },
                            ["^V"] = { bg = color.violet100 },
                        };
                        -- print("color = ", background[mode.mode])
                        vim.api.nvim_set_hl(0, "CursorLine", background[mode.mode] or background.n);
                    end
                }
            }
        },
        -- Configure core features of AstroNvim
        features = {
            large_buf = { size = 1024 * 500, lines = 1000 }, -- set global limits for large files for disabling features like treesitter
            autopairs = true,                                -- enable autopairs at start
            cmp = true,                                      -- enable completion at start
            diagnostics_mode = 2,                            -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
            highlighturl = true,                             -- highlight URLs at start
            notifications = false,                           -- enable notifications at start
        },
        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
            virtual_text = true,
            underline = false,
            update_in_insert = false,
        },
        -- vim options can be configured here
        options = {
            opt = {                     -- vim.opt.<key>
                relativenumber = false, -- sets vim.opt.relativenumber
                spell = false,          -- sets vim.opt.spell
                signcolumn = "yes",     -- sets vim.opt.signcolumn to auto
                showtabline = 0,
                guicursor = "n-v-c:blinkon0,i-ci:ver25,r-cr:hor20,o:hor50",
                cmdheight = 1, -- 0 = remove command line
            },
            g = {              -- vim.g.<key>
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
                    function()
                        local list = vim.api.nvim_list_bufs();
                        local count = #list;
                        if count <= 2 then
                            vim.api.nvim_command "quit"
                        else
                            vim.api.nvim_command "close"
                        end
                    end,
                },
                -- mappings seen under group name "Buffer"
                ["<C-s>"] = { function() vim.cmd "write" end, desc = "Save File" }, -- change description but the same command
                ["<S-s>"] = { function() vim.cmd "write" end, desc = "Save File" }, -- change description but the same command
                ["<C-p>"] = {
                    function() vim.cmd.Telescope "keymaps" end,
                    desc = "Command plane",
                },
                ["<C-r>"] = {
                    -- brew install serpl ast-grep
                    function() require("astrocore").toggle_term_cmd { cmd = "serpl", direction = "float" } end,
                    desc = "Search & Replace",
                },
                ["+"] = {
                    function()
                        vim.api.nvim_feedkeys("<C-a>", "n", true)
                    end
                },
                ["-"] = {
                    function()
                        vim.api.nvim_feedkeys("<C-x>", "n", true)
                    end
                },
                ["mm"] = {
                    function() vim.api.nvim_feedkeys("%", "n", true) end,
                    desc = "jump to match closure"
                }

            },
            v = {
                x = { function() vim.api.nvim_feedkeys("j", "n", false) end },
                X = { function() vim.api.nvim_feedkeys("k", "n", false) end },
                q = { function() vim.api.nvim_command "close" end },
                i = { function() vim.api.nvim_feedkeys("i", "n", false) end },
                a = { function() vim.api.nvim_feedkeys("a", "n", false) end },
                o = { function() vim.api.nvim_feedkeys("o", "n", false) end }
            },
        },
    },
}
