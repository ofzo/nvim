return {
    "onsails/lspkind.nvim",
    lazy = true,
    -- enabled = false,
    opts = function(_, opts)
        -- use codicons preset
        opts.preset = "codicons"
        -- set some missing symbol types
        -- opts.symbol_map = {
        --     Key = "",
        --     Number = "",
        --     Object = "",
        --     Array = "󰅪",
        --     Boolean = "",
        --     Class = "󰌗",
        --     Constructor = "",
        --     Namespace = "",
        --     Null = "",
        --     Package = "󰏗",
        --     Property = "",
        --     Reference = "",
        --     Snippet = "",
        --     String = "󰀬",
        --     TypeParameter = "󰊄",
        --     Unit = "",
        -- }
    end,
}
