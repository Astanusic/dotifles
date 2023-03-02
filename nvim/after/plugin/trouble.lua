local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	return
end

trouble.setup({
	use_diagnostic_signs = true,
})

vim.keymap.set("n", "]w", ":lua require('trouble').next({ skip_groups = true, jump = true })<cr>")
vim.keymap.set("n", "[w", ":lua require('trouble').previous({ skip_groups = true, jump = true })<cr>")
vim.keymap.set("n", "]1", ":lua require('trouble').first({ skip_groups = true, jump = true })<cr>")
vim.keymap.set("n", "[1", ":lua require('trouble').first({ skip_groups = true, jump = true })<cr>")
