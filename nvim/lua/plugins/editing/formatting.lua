return {
    "stevearc/conform.nvim",
    keys = {
        { "<leader>f", function() require("conform").format({ async = true, lsp_fallback = true }) end, desc = "format" },
    },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                python = { "black" },
                lua = { "stylua" },
                rust = { "rustfmt" },
                markdown = { "prettier" },
                tex = { "latexindent" },
                latex = { "latexindent" },
            },
        })
    end,
}