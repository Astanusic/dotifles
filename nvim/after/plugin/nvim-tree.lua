local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
tree.setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	renderer = {
		icons = {
			show = {
				file = false,
			},
		},
	},
})

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
