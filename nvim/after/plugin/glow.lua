local status_ok, glow = pcall(require, "glow")
if not status_ok then
	return
end

glow.setup({
	-- your override config
	{
		border = "shadow", -- floating window border config
		style = "dark", -- filled automatically with your current editor background, you can override using glow json style
		pager = true,
		width = 400,
		height = 600,
		width_ratio = 0.9, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
		height_ratio = 0.8,
	},
})

vim.g.mkdp_auto_start = 1
