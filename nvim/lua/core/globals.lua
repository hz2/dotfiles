local g = vim.g

g.mapleader = " " -- set leader key to space
-- g.maplocalleader = " " -- set local leader key to space

vim.api.nvim_create_autocmd('Filetype', {
    pattern = 'rust',
    command = 'set colorcolumn=100'
})
