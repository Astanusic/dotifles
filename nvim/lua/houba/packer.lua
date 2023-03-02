-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Allow jumping on search but I prefer hop
	use("ggandor/lightspeed.nvim")

	-- Hop on words
	-- use({
	-- 	"phaazon/hop.nvim",
	-- 	branch = "v2", -- optional but strongly recommended
	-- })

	-- better man pages using nvim
	-- use("paretje/nvim-man")

	-- Improve neovim starting time
	use("lewis6991/impatient.nvim")

	use("folke/neodev.nvim")

	use("lukas-reineke/indent-blankline.nvim")

	-- motion animation
	-- use({ "edluffy/specs.nvim" })

	use({
		"goolord/alpha-nvim",
	})

	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	})

	-- Telescope fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = " arch -arm64 make" })
	use({ "camgraff/telescope-tmux.nvim" })
	use("xiyaowong/telescope-emoji.nvim")

	use({
		"folke/lsp-trouble.nvim",
	})

	-- tmux plugin sync resister between pane/session
	use({
		"aserowy/tmux.nvim",
	})

	-- autopairs
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	use("chrisbra/Colorizer")

	-- Allow highlight of same word with lsp and tree sitter
	use("RRethy/vim-illuminate")

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- Colorschemes
	use({
		"rose-pine/neovim",
		as = "rose-pine",
	})

	use({
		"dracula/vim",
		as = "dracula",
	})
	-- use("Mofiqul/dracula.nvim")
	use("folke/tokyonight.nvim")
	use("catppuccin/vim")
	-- use({ "catppuccin/nvim", as = "catppuccin" })
	-- use({ "lalitmee/cobalt2.nvim", requires = "tjdevries/colorbuddy.nvim" })

	-- Lualine blazing fast status line
	use({
		"nvim-lualine/lualine.nvim",
	})

	-- TreeSitter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")

	use("ahmedkhalf/project.nvim")

	-- Line interval
	-- use({ "IMOKURI/line-number-interval.nvim" })

	use("numToStr/Comment.nvim")

	-- Harpoon
	use("ThePrimeagen/harpoon")

	-- Undotree
	use("mbbill/undotree")

	-- tpope collection
	use("tpope/vim-fugitive") -- For git, its getting old honestly but its powerfull
	use("tpope/vim-surround") -- for handling surrounding work even with html tags its awesome
	use("tpope/vim-repeat")
	-- Diffview in singletab
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Gitsign
	use({
		"lewis6991/gitsigns.nvim",
		-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	})

	-- lazygit amazing plugin
	use("kdheepak/lazygit.nvim")

	-- use("jose-elias-alvarez/null-ls.nvim")

	use("nvim-tree/nvim-web-devicons")
	use("rafamadriz/friendly-snippets")
	-- Togglerterm related to cmp
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	-- Bracket color
	use("p00f/nvim-ts-rainbow")

	-- ChatGPT in nvim OMGGGGGG
	use({
		"jackMort/ChatGPT.nvim",
		config = function()
			require("chatgpt").setup({
				-- optional configuration
				max_line_length = 600,
			})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})

	-- Markdown preview in nvim
	use({ "ellisonleao/glow.nvim" })
	-- Markdown preview in browser
	-- use({ "iamcco/markdown-preview.nvim" })
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- LSP Zero collection
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "jose-elias-alvarez/null-ls.nvim" },
			-- { "jayp0521/mason-null-ls.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
end)
