local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gts", ":Gtabedit :<cr>")
vim.keymap.set("n", "<leader>ga", ":Gwrite<cr>")
vim.keymap.set("n", "<leader>gc", ":Git commit -m '")
vim.keymap.set("n", "<leader>gam", ":Git commit -am '")
vim.keymap.set("n", "<leader>gp", ":Git push<cr>")
local current_branch = string.gsub(vim.fn.system("git symbolic-ref --short HEAD"), "\n", "")
vim.keymap.set("n", "<leader>gsp", ":!git push --set-upstream origin " .. current_branch .. "<cr>")

vim.keymap.set("n", "<leader>gr", ":Git rebase –continue<cr>")

gitsigns.setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- -- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})
