return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "iceberg_dark",
                -- refresh = {
                --     statusline = 100,  -- refresh every 100ms instead of immediately
                --     tabline = 100,
                --     winbar = 100,
                -- },
                -- section_separators = { left = "", right = "" },
                -- component_separators = { left = "", right = "" },
                -- globalstatus = true,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = {
                    {
                        "fileformat",
                        symbols = {
                            -- nerd font icons: https://www.nerdfonts.com/cheat-sheet
                            unix = '', -- e712
                            dos = '',  -- e70f
                            mac = '',  -- e711
                        }
                    },
                    'encoding',
                    'filetype'
                },
                lualine_y = {
                    {
                        function()
                            local current_line = vim.fn.line('.')
                            local total_lines = vim.fn.line('$')

                            if current_line == 1 then
                                return 'celi'
                            elseif current_line == total_lines then
                                return 'floor'
                            else
                                local progress = math.floor(current_line * 100 / total_lines)
                                return string.format('%2d%%%%', progress)
                            end
                        end,
                        icon = '',
                        cond = function() return vim.fn.line('$') > 1 end,  -- only show if file has content
                    }
                },
                lualine_z = { 'location' }
            }
        })
    end,
}
