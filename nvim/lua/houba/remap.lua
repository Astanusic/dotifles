vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

vim.keymap.set("", "<C-z>", "<Nop>", opts)

vim.keymap.set("", "<C-s>", ":w!<CR>", opts)
vim.keymap.set("", "<C-q>", ":q!<CR>", opts)
vim.keymap.set("", "<C-z>", ":wqa!<CR>", opts)

vim.keymap.set("", "<M-q>", ":copen<cr>", opts)
vim.keymap.set("", "]q", ":cnext<cr>", opts)
vim.keymap.set("", "[q", ":cprev<cr>", opts)

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-0>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-9>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-,>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-/>", ":vertical resize +2<CR>", opts)

-- Add line up/below without leaving normal mode
vim.keymap.set("n", "<leader>o", "o<Esc>kk<CR>", opts)
vim.keymap.set("n", "<leader>O", "O<Esc><CR>", opts)

vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.keymap.set("n", "<leader>z", ":nohlsearch<CR>", opts)

-- move text in visual mode up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
-- move text in normal mode up/down
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", opts)

-- yank to last non blank char of the line
vim.keymap.set("n", "Y", "yg_", opts)
-- C-d/C-u keep the cursor in center of buffer
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
-- prev/next occurence of search keep cursor in center of bufferc
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

vim.keymap.set("n", "Q", "<nop>", opts)
-- Null-ls lsp format buffer but format on save is on
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)

-- greatest remap ever
-- it delete selection and put in void register
vim.keymap.set("x", "<leader>p", [["_dP]], opts)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], opts)

-- next greatest remap ever : asbjornHaland
-- my god this one so nice, it yank to + register, which is system clipboard register
-- guess what ? because its system clipboard it fill Maccy history
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], opts)
vim.keymap.set("n", "<leader>Y", [["+Y]], opts)

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>", opts)

-- change current buffer file to be executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }, opts)
