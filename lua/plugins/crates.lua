return {
    { import = "astrocommunity.pack.toml" },
    {
        "Saecki/crates.nvim",
        lazy = true,
        dependencies = {
            "AstroNvim/astrocore",
            opts = {
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
            },
        },
        opts = {
            completion = {
                cmp = { enabled = true },
                crates = {
                    enabled = true,
                },
            },
            null_ls = {
                enabled = true,
                name = "crates.nvim",
            },
        },
    },
}
