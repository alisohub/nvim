return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
        icons = {
            indent = {
                fold_open = "v ",
                fold_closed = "> ",
            },
        },
    },
    keys = {
        {
            "<leader>xq",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
    },
}
