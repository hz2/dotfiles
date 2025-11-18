-- https://github.com/hrsh7th/nvim-cmp/blob/main/doc/cmp.txt
return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "neovim/nvim-lspconfig", -- LSP configurations
        "hrsh7th/cmp-nvim-lsp", -- lsp completions
        "hrsh7th/cmp-buffer", -- buffer completions
        "hrsh7th/cmp-path", -- path completions
        "onsails/lspkind.nvim" -- vscode-like pictograms
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require('lspkind')

        -- https://github.com/hrsh7th/nvim-cmp/blob/main/doc/cmp.txt#L450
        cmp.setup({
            performance = {
                max_view_entries = 10, -- limit to 10 visible suggestions
            },

            snippet = {
                expand = function(args)
                    -- for snippet engine integration,  one of these:
                    -- vim.fn["vsnip#anonymous"](args.body)  -- for vsnip
                    -- require('luasnip').lsp_expand(args.body) -- for luasnip
                    vim.snippet.expand(args.body)  -- for native neovim snippets (0.10+)
                end
            },

            mapping = cmp.mapping.preset.insert({
                -- ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- scroll docs up
                -- ['<C-f>'] = cmp.mapping.scroll_docs(4), -- scroll docs down
                ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- scroll docs up
                ['<C-d>'] = cmp.mapping.scroll_docs(4), -- scroll docs down
                ['<C-Space>'] = cmp.mapping.complete(), -- trigger completion
                ['<C-e>'] = cmp.mapping.abort(), -- close completion menu
                ['<CR>'] = cmp.mapping.confirm({
                    select = true
                }) -- confirm selection
            }),

            -- completion sources (order matters for priority)
            sources = cmp.config.sources({
                {
                    name = 'copilot',
                    max_item_count = 2, -- limit copilot to 2 suggestions max
                },
                {
                    name = 'nvim_lsp',
                },
                {
                    name = 'gh_issues',
                }, 
                {
                    name = 'nvim_lua',
                }, 
                {
                    name = 'path',
                },
                {
                    name = 'luasnip',
                },
                {
                    name = 'buffer',
                    keyword_length = 5,
                }
            }),

            -- window = {
            --     completion = cmp.config.window.bordered(),
            --     documentation = cmp.config.window.bordered(),
            -- },

            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol', -- show only symbol annotations
                    maxwidth = {
                        -- prevent the popup from showing more than provided characters
                        menu = 50, -- leading text (labelDetails)
                        abbr = 50 -- actual suggestion item
                    },
                    ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
                    show_labelDetails = true, -- show labelDetails in menu. disabled by default

                    -- the function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization
                    before = function(entry, vim_item)
                        -- source menu labels with icons
                        vim_item.menu = ({
                            copilot = "[🤖 AI]", -- copilot suggestions with robot icon
                            nvim_lsp = "[LSP]",
                            buffer = "[buf]",
                            path = "[path]",
                            nvim_lua = "[API]",
                            luasnip = "[snip]",
                            gh_issues = "[issues]"
                        })[entry.source.name]
                        return vim_item
                    end
                })
            },

            -- experimental features
            experimental = {
                native_menu = false,
                ghost_text = true -- show preview of completion
            }
        })

        -- cmp.setup.cmdline({ '/', '?' }, {
        --     mapping = cmp.mapping.preset.cmdline(),
        --     sources = {
        --         { name = 'buffer' }
        --     }
        -- })

        -- cmp.setup.cmdline(':', {
        --     mapping = cmp.mapping.preset.cmdline(),
        --     sources = cmp.config.sources({
        --         { name = 'path' }
        --     }, {
        --         { name = 'cmdline' }
        --     })
        -- })
    end

    -- TODO: @hz2 handle github issue
}