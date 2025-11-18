local o = vim.opt

o.number = true             -- show absolute line numbers
o.relativenumber = true     -- show relative line numbers
o.tabstop = 4               -- number of spaces a tab counts for
o.shiftwidth = 4            -- number of spaces for each indentation level
o.expandtab = true          -- convert tabs to spaces
o.autoindent = true         -- copy indent from current line when starting new line
o.smartindent = true        -- smart autoindenting when starting new line
o.incsearch = true          -- search as characters are entered
o.incsearch = true          -- search as characters are entered
o.ignorecase = true         -- case insensitive searching
o.smartcase = true          -- case sensitive if search contains uppercase
o.cursorline = false        -- highlight current line
o.termguicolors = true      -- enable 24-bit RGB colors
o.background = "dark"       -- dark background
o.signcolumn = "yes"        -- always show sign column
-- o.guicursor = "a:blinkon2"  -- make cursor blink (every 2 seconds)
o.clipboard = "unnamedplus" -- use system clipboard
o.mouse = "a"               -- enable mouse support
o.splitright = true         -- vertical splits go to right
o.splitbelow = true         -- horizontal splits go below
o.wrap = false              -- don't wrap long lines (set to true to enable soft wrap)
-- o.textwidth = 80 -- automatically wrap at 80 characters when typing
o.colorcolumn = "80"        -- show vertical line at column 80
o.scrolloff = 8             -- keep 8 lines above/below cursor
o.sidescrolloff = 8         -- keep 8 columns left/right of cursor
o.spell = true
o.spelllang = "en_us"
o.undofile = true           -- ~/.local/state/nvim/undo/
o.vb = false                -- never beep
o.updatetime = 300          -- faster completion (default is 4000ms)
o.timeoutlen = 300          -- time to wait for mapped sequence to complete
o.ttimeoutlen = 10          -- time to wait for key code sequence to complete
o.wildmode = 'list:longest' -- better completion in command mode
o.wildignore = {
    '.hg',
    '.svn',
    '*~',
    '*.png',
    '*.jpg',
    '*.gif',
    '*.min.js',
    '*.swp',
    '*.o',
    'vendor',
    'dist',
    '_site'
} -- ignore these files/folders in file completion

-- completion settings for better ai integration
o.completeopt = { 'menu', 'menuone', 'noselect', 'popup' } -- improved completion menu with popup support
