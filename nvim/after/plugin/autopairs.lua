local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

autopairs.setup({
	disable_filetype = { "TelescopePrompt", "vim" },
	map_c_h = true, -- map <C-h> to cancel a pair
})
