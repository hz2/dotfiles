-- https://github.com/nvim-telescope/telescope.nvim/blob/master/developers.md
return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim", -- Required
            {
                "nvim-telescope/telescope-fzf-native.nvim", -- Faster sorting
                build = "make", -- Compile fzf binary
                cond = function()
                    return vim.fn.executable("make") == 1
                end
            }, "nvim-tree/nvim-web-devicons" -- File icons
        },

        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            telescope.setup({
                defaults = {
                    -- UI Configuration
                    prompt_prefix = "🔍 ",
                    selection_caret = "▶ ",
                    path_display = {"truncate"},

                    -- File ignore patterns
                    file_ignore_patterns = {
                        "%.git/", -- figure out how to not ignore the COMMIT_EDITMSG
                        "%.cache/", 
                        "%.o", 
                        "%.a", 
                        "%.out", 
                        "%.class",
                        "%.pdf", 
                        "%.mkv", 
                        "%.mp4", 
                        "%.zip",
                        "%.tar",
                        "%.tar.gz",
                        "target/",
                    },

                    -- Layout configuration
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.55,
                            results_width = 0.8
                        },
                        vertical = {mirror = false},
                        width = 0.87,
                        height = 0.80,
                        preview_cutoff = 120
                    },

                    mappings = {
                        -- insert mode
                        i = {
                            -- navigation
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-n>"] = actions.cycle_history_next,
                            ["<C-p>"] = actions.cycle_history_prev,

                            -- selection actions
                            ["<C-q>"] = actions.send_to_qflist +
                                actions.open_qflist,
                            ["<C-l>"] = actions.send_selected_to_qflist +
                                actions.open_qflist,

                            -- window management
                            ["<C-x>"] = actions.select_horizontal,
                            ["<C-v>"] = actions.select_vertical,
                            ["<C-t>"] = actions.select_tab,

                            -- preview scrolling
                            ["<C-u>"] = actions.preview_scrolling_up,
                            ["<C-d>"] = actions.preview_scrolling_down
                        },
                        -- normal mode
                        n = {
                            ["<esc>"] = actions.close,
                            ["<CR>"] = actions.select_default,
                            ["<C-x>"] = actions.select_horizontal,
                            ["<C-v>"] = actions.select_vertical,
                            ["<C-t>"] = actions.select_tab,

                            ["<Tab>"] = actions.toggle_selection +
                                actions.move_selection_worse,
                            ["<S-Tab>"] = actions.toggle_selection +
                                actions.move_selection_better,
                            ["<C-q>"] = actions.send_to_qflist +
                                actions.open_qflist,
                            ["<M-q>"] = actions.send_selected_to_qflist +
                                actions.open_qflist,

                            ["j"] = actions.move_selection_next,
                            ["k"] = actions.move_selection_previous,
                            ["H"] = actions.move_to_top,
                            ["M"] = actions.move_to_middle,
                            ["L"] = actions.move_to_bottom,

                            ["<Down>"] = actions.move_selection_next,
                            ["<Up>"] = actions.move_selection_previous,
                            ["gg"] = actions.move_to_top,
                            ["G"] = actions.move_to_bottom,

                            ["<C-u>"] = actions.preview_scrolling_up,
                            ["<C-d>"] = actions.preview_scrolling_down,

                            ["?"] = actions.which_key
                        }
                    }
                },

                pickers = {
                    find_files = {
                        -- theme = "dropdown", -- Try: dropdown, cursor, ivy
                        hidden = false
                        -- find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
                    },

                    live_grep = {
                        -- theme = "ivy",
                        additional_args = function(opts)
                            return {"--hidden"}
                        end
                    },

                    buffers = {
                        theme = "dropdown",
                        previewer = false,
                        initial_mode = "normal",
                        mappings = {
                            -- insert mode
                            i = {["<C-d>"] = actions.delete_buffer},
                            -- normal mode
                            n = {["dd"] = actions.delete_buffer}
                        }
                    },

                    colorscheme = {enable_preview = true}

                    --   lsp_references = {
                    --     theme = "cursor",
                    --     initial_mode = "normal",
                    --   },

                    --   lsp_definitions = {
                    --     theme = "cursor", 
                    --     initial_mode = "normal",
                    --   },

                    --   lsp_declarations = {
                    --     theme = "cursor",
                    --     initial_mode = "normal", 
                    --   },

                    --   lsp_implementations = {
                    --     theme = "cursor",
                    --     initial_mode = "normal",
                    --   },
                },

                -- extensions configuration
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case"
                    }

                    -- example for future extensions:
                    -- ["ui-select"] = {
                    --   require("telescope.themes").get_dropdown {
                    --     -- even more opts
                    --   }
                    -- },
                }
            })

            pcall(telescope.load_extension, "fzf")
            -- pcall(telescope.load_extension, "ui-select")
        end,

        cmd = "Telescope",
        keys = { -- file pickers
            {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files"},
            {
                "<leader>fa",
                "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>",
                desc = "Find All Files"
            },
            {"<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep"},
            {"<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers"},
            {"<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags"},
            {"<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files"},
            {
                "<leader>fc",
                "<cmd>Telescope colorscheme<cr>",
                desc = "Colorschemes"
            }, -- git pickers
            {
                "<leader>gc",
                "<cmd>Telescope git_commits<cr>",
                desc = "Git Commits"
            },
            {
                "<leader>gb",
                "<cmd>Telescope git_branches<cr>",
                desc = "Git Branches"
            },
            {"<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status"}, -- vim pickers  
            --   { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
            --   { "<leader>fC", "<cmd>Telescope commands<cr>", desc = "Commands" },
            --   { "<leader>fo", "<cmd>Telescope vim_options<cr>", desc = "Vim Options" },
            -- search pickers
            {
                "<leader>fw",
                "<cmd>Telescope grep_string<cr>",
                desc = "Grep String"
            }, {
                "<leader>fs",
                "<cmd>Telescope current_buffer_fuzzy_find<cr>",
                desc = "Buffer Search"
            } -- LSP pickers (will be available when LSP is active)
            --   { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "LSP References" },
            --   { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "LSP Definitions" },
            --   { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
            --   { "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },
        }
    }
}
