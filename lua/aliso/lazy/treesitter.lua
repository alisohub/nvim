return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        ts.setup({})

        local parsers = {
            "bash",
            "c",
            "css",
            "gitignore",
            "go",
            "html",
            "javascript",
            "json",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
        }

        local group = vim.api.nvim_create_augroup("AlisoTreesitter", { clear = true })

        -- Install missing parsers asynchronously once lazy finishes startup
        vim.api.nvim_create_autocmd("User", {
            group = group,
            pattern = "VeryLazy",
            once = true,
            callback = function()
                if type(ts.install) == "function" then
                    ts.install(parsers)
                end
            end,
        })

        -- Enable Treesitter highlighting safely only when a parser exists for the filetype
        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            callback = function(args)
                if vim.bo[args.buf].buftype ~= "" then
                    return
                end
                local ft = vim.bo[args.buf].filetype
                local lang = vim.treesitter.language.get_lang(ft) or ft
                if not lang or lang == "" then
                    return
                end
                local ok = pcall(vim.treesitter.language.add, lang)
                if ok then
                    pcall(vim.treesitter.start, args.buf, lang)
                end
            end,
        })
    end,
}
