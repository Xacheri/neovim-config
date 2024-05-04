local km = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Window navigation
km("n", "<C-h>", "<C-w>h", opts)
km("n", "<C-j>", "<C-w>j", opts)
km("n", "<C-k>", "<C-w>k", opts)
km("n", "<C-l>", "<C-w>l", opts)

-- Window resizing
km("n", "<C-Up>", ":resize +2<CR>", opts)
km("n", "<C-Down>", ":resize -2<CR>", opts)
km("n", "<C-Left>>", ":vertical resize -2<CR>", opts)
km("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Leader key
km("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

km("n", "<leader>e", ":Lex 18<cr>", opts) -- Maps space+e to typing :Lex 25 and pressing enter, macroing the file explorer
km("n", "<S-l>", ":bnext<cr>", opts)
km("n", "<S-h>", ":bprevious<cr>", opts)

-- Escape to normal mode from insert
km("i", "<ctrl+[>", "<ESC>", opts)

-- Telescope command bindings
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

