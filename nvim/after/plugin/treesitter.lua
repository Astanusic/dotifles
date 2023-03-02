local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
	-- ...
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
	ensure_installed = { "help", "javascript", "typescript", "html", "c", "lua", "rust", "css", "json", "vue" },
	autotag = {
		enable = true,
	},
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	-- Automatically install missing parsers when entering buffer
	auto_install = true,
	highlight = {
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})

vim.api.nvim_set_hl(0, "@property.css", { link = "Type" })
vim.api.nvim_set_hl(0, "@function.css", { link = "Error" })
vim.api.nvim_set_hl(0, "@selector.css", { link = "PreProc" })
vim.api.nvim_set_hl(0, "@operator.css", { link = "Statement" })
vim.api.nvim_set_hl(0, "@type.css", { link = "Identifier" })

vim.api.nvim_set_hl(0, "@type.qualifier", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@property", { link = "Tag" })
vim.api.nvim_set_hl(0, "@tag.name", { link = "Type" })
vim.api.nvim_set_hl(0, "@key", { link = "Type" })
