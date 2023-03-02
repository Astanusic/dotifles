vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 25
vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmd = "cp -r"

local mappings = {
	-- Classic bread and butter
	{ lhs = "n", rhs = "%" },
	{ lhs = "r", rhs = "R" }, -- rename
	{ lhs = "H", rhs = "u" }, -- go back in history
	{ lhs = "h", rhs = "-^" }, -- "../"
	{ lhs = "l", rhs = "<CR>" }, -- open directory or file under cursor
	{ lhs = ".", rhs = "gh" }, -- toggle hidden files
	{ lhs = "P", rhs = "<C-w>z" }, -- close preview, "p" to open it
	{ lhs = "<Leader>e", rhs = ":Lexplore<CR>" }, -- close preview, "p" to open it
	{ lhs = "<Leader>r", rhs = ":Vexplore<CR>" }, -- close preview, "" to open it
	{ lhs = "L", rhs = "<CR>:Lexplore<CR>" }, -- open file and close Ex
	-- MARKING
	{ lhs = "<TAB>", rhs = "mf" }, -- toggle mark on file/directory
	{ lhs = "<S-TAB>", rhs = "mF" }, -- unmark all file files in current buffer
	{ lhs = "<Leader><TAB>", rhs = "mu" }, -- remove all mark on all files
	-- FILE MANAGING UNDER "f" KEY
	{ lhs = "ff", rhs = "%:w<CR>:buffer #<CR>" }, -- create file and save it then come back to Ex
	{ lhs = "fc", rhs = "mc" }, -- copy marked files
	{ lhs = "fC", rhs = "mtmc" }, -- use skip to copy marked files, it auto target directory under cursor
	{ lhs = "fm", rhs = "mm" }, -- move marked files
	{ lhs = "fM", rhs = "mtmm" }, -- use skip to move marked files
	{ lhs = "f;", rhs = "mx" }, -- run external command on marked files
	{ lhs = "fl", rhs = ":echo netrw#Expose('netrwmarkfilelist')<CR>" },
	{ lhs = "fq", rhs = ":echo 'Target:' . netrw#Expose('netrwmftgt')<CR>" },
	{ lhs = "bb", rhs = "mb" }, -- add bookmark
	{ lhs = "bd", rhs = "mB" }, -- remove recent bookmark
	{ lhs = "bl", rhs = "gb" }, -- jump to most recent bookmark
}

vim.keymap.set("n", "<leader>e", vim.cmd.Lexplore)
vim.keymap.set("n", "<leader>r", vim.cmd.Vexplore)

local function bind(mapping)
	vim.keymap.set("n", mapping.lhs, mapping.rhs, { remap = true, buffer = true })
end

vim.api.nvim_create_autocmd("filetype", {
	pattern = "netrw",
	desc = "Better mappings for netrw",
	callback = function()
		for _, mapping in ipairs(mappings) do
			bind(mapping)
		end
	end,
})
