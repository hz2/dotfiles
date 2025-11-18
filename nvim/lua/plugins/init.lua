local plugins = {}

-- helper function to safely load plugin modules
local function safe_require(module)
    -- vim.notify("Attempting to load module: " .. module, vim.log.levels.DEBUG)
    local ok, result = pcall(require, module)
    if ok and type(result) == "table" then
        -- vim.notify("Successfully loaded module: " .. module, vim.log.levels.DEBUG)
        if result[1] and type(result[1]) == "string" then -- single module
            return { result }
        else -- array of modules
            return result
        end
    else
        vim.notify("Could not load module " .. module .. " - " .. tostring(result), vim.log.levels.ERROR)
        return {}
    end
end

-- UI
vim.list_extend(plugins, safe_require("plugins.ui.colorscheme"))
vim.list_extend(plugins, safe_require("plugins.ui.lualine"))
vim.list_extend(plugins, safe_require("plugins.ui.nvim-tree"))
vim.list_extend(plugins, safe_require("plugins.ui.telescope"))
vim.list_extend(plugins, safe_require("plugins.ui.markdown-preview"))

vim.list_extend(plugins, safe_require("plugins.lsp.nvim-lspconfig"))
vim.list_extend(plugins, safe_require("plugins.lsp.nvim-cmp"))

-- editing
vim.list_extend(plugins, safe_require("plugins.editing.autopairs"))
vim.list_extend(plugins, safe_require("plugins.editing.comment"))
vim.list_extend(plugins, safe_require("plugins.editing.formatting"))
vim.list_extend(plugins, safe_require("plugins.editing.treesitter"))

-- ai assistance
vim.list_extend(plugins, safe_require("plugins.ai.copilot"))
vim.list_extend(plugins, safe_require("plugins.ai.copilotchat"))
vim.list_extend(plugins, safe_require("plugins.ai.copilot-cmp"))

-- Language
-- vim.list_extend(plugins, safe_require("plugins.lang.rust"))


-- vim.notify("Total plugins loaded: " .. #plugins, vim.log.levels.INFO)
-- for i, plugin in ipairs(plugins) do
--     if type(plugin) == "table" and plugin[1] then
--         vim.notify("Plugin " .. i .. ": " .. plugin[1], vim.log.levels.DEBUG)
--     end
-- end

return plugins
