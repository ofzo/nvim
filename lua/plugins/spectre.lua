return {
    "nvim-pack/nvim-spectre",
    keys = {
        { "<leader>s", "<cmd>:Spectre<cr>", desc = "Search and Replace" },
    },
    config = function()
        require("spectre").setup {
            live_update = true,
        }
    end,
}
