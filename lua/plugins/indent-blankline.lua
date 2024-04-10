return {
    "lukas-reineke/indent-blankline.nvim",
    event = "User AstroFile",
    main = "ibl",
    opts = {
        indent = { char = "▏", smart_indent_cap = true },
        whitespace = {
            remove_blankline_trail = false,
        },
        scope = { enabled = true },
    },
}
