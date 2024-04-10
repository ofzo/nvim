-- Customize Treesitter

---@type LazySpec
return {
    "nvim-treesitter/nvim-treesitter",
    -- enabled = false,
    opts = function(_, opts)
        -- add more things to the ensure_installed table protecting against community packs modifying it
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
            "lua",
            "vim",
            -- add more arguments for adding more treesitter parsers
        })
    end,
    config = function()
        require("nvim-treesitter.configs").setup({
            textobjects = {
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["mf"] = "@function.outer",
                        ["mc"] = "@class.outer"
                    },
                    goto_previous_start = {
                        ["mF"] = "@function.outer",
                        ["mC"] = "@class.outer",
                    },
                },
                select = {
                    enable = true,
                    keymaps = {
                        ["msF"] = "@function.outer",
                        ["msf"] = "@function.inner",
                        ["msC"] = "@function.outer",
                        ["msc"] = "@function.inner"
                    }
                }
            }
        })
    end
}
