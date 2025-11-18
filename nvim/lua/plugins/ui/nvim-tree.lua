-- nvim-tree.lua - File explorer plugin
return {{
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons" -- optional, for file icons
    },
    lazy = true,
    cmd = {"NvimTreeToggle", "NvimTreeFocus"},

    config = function()
        -- disable netrw at the very start (recommended for nvim-tree)
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = {
                width = 30,
                side = "left"
            },
            renderer = {
                group_empty = true,
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true
                    }
                }
            },
            filters = {
                dotfiles = false -- show hidden files
            },
            git = {
                enable = true,
                ignore = false
            },
            actions = {
                open_file = {
                    quit_on_open = false -- don't close tree when opening file
                }
            }
        })
    end
}}
