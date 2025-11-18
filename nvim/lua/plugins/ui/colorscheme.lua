return {
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd([[colorscheme nordic]])

            -- https://neovim.io/doc/user/api.html#nvim_set_hl()
            -- https://neovim.io/doc/user/options.html#'colorcolumn'
            vim.api.nvim_set_hl(0, 'ColorColumn', { 
                -- blend = 10,
                bg = '#3e4451',
                -- fg = '#3e4451',
                -- sp = '#3e4451',
                -- underdashed = true,
                -- ctermbg = 238,    -- for terminal compatibility
            })
        end
    },
}
