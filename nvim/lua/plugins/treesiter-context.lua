return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "VeryLazy",
  opts = function()
    local tsc = require("treesitter-context")
    tsc.setup({
      enable = false,
    })

    return { mode = "cursor", max_lines = 3 }
  end,
}
