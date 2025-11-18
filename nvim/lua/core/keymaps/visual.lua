-- indent and de-indent selected text with tab and shift+tab
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true, desc = "indent and reselect" })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true, desc = "de-indent and reselect" })

-- move selected text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "move selection up" })

-- paste over selected text without yanking it
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true, desc = "paste over without yanking" })

-- keep cursor in place when yanking
vim.keymap.set("v", "y", "ygv<Esc>", { noremap = true, silent = true, desc = "keep cursor in place when yanking" })
