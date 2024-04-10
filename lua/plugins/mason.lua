---@type LazySpec
return {
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require("lsp_signature").setup() end,
    },
    {
        "onsails/lspkind.nvim",
        lazy = true,
        -- enabled = false,
        opts = function(_, opts)
            -- use codicons preset
            opts.preset = "codicons"
            -- set some missing symbol types
        end,
    },
    -- use mason-lspconfig to configure LSP installations
    {
        "williamboman/mason-lspconfig.nvim",
        -- overrides `require("mason-lspconfig").setup(...)`
        opts = function(_, opts)
            require("lspconfig.ui.windows").default_options.border = "rounded"
            -- add more things to the ensure_installed table protecting against community packs modifying it
            opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
                "lua_ls",
                -- add more arguments for adding more language servers
            })
            opts.automatic_installation = false
        end,
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    {
        "jay-babu/mason-null-ls.nvim",
        -- overrides `require("mason-null-ls").setup(...)`
        opts = function(_, opts)
            -- add more things to the ensure_installed table protecting against community packs modifying it
            opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
                "prettier",
                "stylua",
                -- add more arguments for adding more null-ls sources
            })
        end,
    },
    {
        "williamboman/mason.nvim",
        cmd = {
            "Mason",
            "MasonInstall",
            "MasonUninstall",
            "MasonUninstallAll",
            "MasonLog",
        },
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_uninstalled = "✗",
                    package_pending = "⟳",
                },
                border = "rounded",
                height = 0.6,
                width = 0.7,
            },
        },
        build = ":MasonUpdate",
        -- config = require "plugins.configs.mason",
    },
}
