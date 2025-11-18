--------------------------------------------------------------------------
-- format: <mode>, <key>, <command>, <options>
-- mode: n (normal), i (insert), v (visual), x (visual block), t (terminal), c (command)
-- key: key combination
-- command: command to execute,
-- options: table of options

-- C- = Control key
-- S- = Shift key
-- M- = Alt key (Meta key)
--------------------------------------------------------------------------

-- general
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, desc = "leader key to space" })

-- nvim-tree
vim.keymap.set("n", "<C-N>", ":NvimTreeToggle<cr>", { noremap = true, silent = true, desc = "toggle nvim-tree" })
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", { noremap = true, silent = true, desc = "toggle nvim-tree" })
vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<cr>", { noremap = true, silent = true, desc = "find current file in tree" })

-- telescope 
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { noremap = true, silent = true, desc = "find files" })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", { noremap = true, silent = true, desc = "live grep search" })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", { noremap = true, silent = true, desc = "find buffers" })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>", { noremap = true, silent = true, desc = "help tags" })

-- windows 
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "move to right window" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { noremap = true, silent = true, desc = "split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { noremap = true, silent = true, desc = "split window horizontally" })

-- buffers
vim.keymap.set("n", "<S-l>", ":bnext<cr>", { noremap = true, silent = true, desc = "go to next buffer" }) 
vim.keymap.set("n", "<S-h>", ":bprevious<cr>", { noremap = true, silent = true, desc = "go to previous buffer" })

-- lets you split and open definition in different ways
-- keymap("n", "gdx", ":belowright split | lua vim.lsp.buf.definition()<CR>", opts)
-- keymap("n", "gdv", ":vsplit | lua vim.lsp.buf.definition()<CR>", opts)
-- keymap("n", "gdt", ":tab split | lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "ggb", ":belowright split | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true, desc = "go to definition in horizontal split" })
vim.keymap.set("n", "ggv", ":vsplit | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true, desc = "go to definition in vertical split" })
vim.keymap.set("n", "ggt", ":tab split | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true, desc = "go to definition in new tab" })

-- open and close buffers
vim.keymap.set('n', '<leader>bn', ':enew<cr>', { desc = "open new buffer" })

-- split buffers
vim.keymap.set('n', '<leader>bs', ':split<cr>', { desc = "split buffer horizontally" })
vim.keymap.set('n', '<leader>bv', ':vsplit<cr>', { desc = "split buffer vertically" })


vim.keymap.set('n', '<left>', ':bp<cr>', { desc = "go to previous buffer" })
vim.keymap.set('n', '<right>', ':bn<cr>', { desc = "go to next buffer" })
vim.keymap.set('n', '<leader>bd', ':bd<cr>', { desc = "close current buffer" })
vim.keymap.set('n', '<leader>bD', ':bd!<cr>', { desc = "force close current buffer" })
vim.keymap.set('n', '<leader>ba', ':%bd|e#|bd#', { desc = "close all buffers except current" })

-- diagnostics
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })

-- searching
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "clear search highlighting" }) -- clear search highlight