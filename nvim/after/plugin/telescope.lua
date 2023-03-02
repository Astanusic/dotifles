local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local builtin = require("telescope.builtin")

-- Custom actions
local action_state = require("telescope.actions.state")

function copy_selected_file_path()
	local selected_entry = action_state.get_selected_entry()
	if selected_entry == nil then
		return
	end
	vim.api.nvim_call_function("setreg", { "+", selected_entry.value })
	vim.api.nvim_command("normal! gvy")
end

vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>F", builtin.live_grep, {})

telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		emoji = {
			action = function(emoji)
				vim.fn.setreg("*", emoji.value)
				print([[Press p or "*p to paste this emoji]] .. emoji.value)
			end,
		},
	},

	pickers = {
		find_files = {
			mappings = {
				n = {
					["y"] = copy_selected_file_path,
				},
				i = {
					["<C-y>"] = copy_selected_file_path,
				},
			},
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("emoji")
telescope.load_extension("projects")
telescope.load_extension("harpoon")
telescope.load_extension("tmux")
