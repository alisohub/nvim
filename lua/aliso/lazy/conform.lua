return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                rust = { "rustfmt" },
            },
            default_format_opts = {
                lsp_format = "fallback",
            },
        })

        vim.keymap.set("n", "<leader>lf", function()
            require("conform").format({ bufnr = 0, lsp_format = "fallback" })
        end, { desc = "Format buffer" })
    end,
}
