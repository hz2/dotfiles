-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.txt
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp" -- completion capabilities
    },

    -- setup language servers
    config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- setup keybindings when LSP attaches
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                local bufopts = {
                    noremap = true,
                    silent = true,
                    buffer = event.buf
                }

                -- show which LSP attached
                vim.notify("LSP attached: " .. (client and client.name or "unknown"), vim.log.levels.INFO)

                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)    -- goto declaration
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)     -- goto definition
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)     -- goto references
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)           -- goto hover
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts) -- goto implementation
                -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)   -- show signature help
                -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)      -- keep your key
                -- vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)       -- add reference key too
                -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts) -- keep your key
                -- vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, bufopts) -- add reference key
                vim.keymap.set('n', '<leader>f', function()
                    vim.lsp.buf.format { async = true }
                end, bufopts)

                -- enable inlay hints if supported (but disabled by default like reference)
                if client and client.supports_method("textDocument/inlayHint") then
                    vim.lsp.inlay_hint.enable(false, { bufnr = event.buf }) -- disabled by default
                end

                -- disable semantic tokens to avoid highlight conflicts
                if client then
                    client.server_capabilities.semanticTokensProvider = nil
                end

                -- format on save for Rust
                if client.name == "rust_analyzer" and client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup("RustFormat", { clear = true }),
                        buffer = event.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = event.buf })
                        end,
                    })
                end
            end
        })

        -- language-specific LSP configurations
        local function setup_server(server_name, server_config, lang_name)
            -- local start_time = vim.uv.hrtime()
            if type(server_config) == 'table' then
                local config = vim.tbl_deep_extend('force', { capabilities = capabilities }, server_config)
                vim.lsp.config(server_name, config)
                vim.lsp.enable(server_name)
                -- local elapsed = (vim.uv.hrtime() - start_time) / 1000000 -- convert to ms
                -- vim.notify(string.format("✓ %s (%s) - %.2fms", server_name, lang_name, elapsed), vim.log.levels.INFO)
            elseif server_config == true then
                vim.lsp.config(server_name, { capabilities = capabilities })
                vim.lsp.enable(server_name)
                -- local elapsed = (vim.uv.hrtime() - start_time) / 1000000 -- convert to ms
                -- vim.notify(string.format("✓ %s (%s, default) - %.2fms", server_name, lang_name, elapsed), vim.log.levels.INFO)
            end
        end

        local function load_lang_config(lang_name)
            local success, config = pcall(require, 'plugins.lang.' .. lang_name)
            if not success then
                vim.notify("✗ Failed to load " .. lang_name .. ": " .. config, vim.log.levels.ERROR)
                return
            end

            if type(config) ~= 'table' then return end

            if type(config.setup) == 'function' then
                config.setup(capabilities)
                -- vim.notify("✓ " .. lang_name .. " (custom setup)", vim.log.levels.INFO)
            elseif type(config.servers) == 'table' then
                for server_name, server_config in pairs(config.servers) do
                    setup_server(server_name, server_config, lang_name)
                end
            else
                vim.notify("✗ " .. lang_name .. " missing 'setup' or 'servers'", vim.log.levels.WARN)
            end
        end

        local function load_lang_configs()
            local lang_dir = vim.fn.stdpath('config') .. '/lua/plugins/lang'
            local lang_files = vim.fn.glob(lang_dir .. '/*.lua', false, true)

            for _, file_path in ipairs(lang_files) do
                local lang_name = vim.fn.fnamemodify(file_path, ':t:r')
                load_lang_config(lang_name)
            end
        end

        load_lang_configs()
    end
}
