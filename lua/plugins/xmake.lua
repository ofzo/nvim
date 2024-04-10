return {
    "Mythos-404/xmake.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    event = "BufReadPost xmake.lua",
    config = true,
}
