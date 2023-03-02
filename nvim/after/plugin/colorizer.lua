local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	return
end

colorizer.setup()

vim.g.colorizer_auto_color = 1
