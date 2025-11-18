vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
    signs = true,
    underline = true,
    severity_sort = true,
    update_in_insert = false,
    float = {
        border = "rounded",
        source = "always",
        header = "",
        focusable = true,
    },
})
