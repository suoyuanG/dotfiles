return {
    {
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
    {
      "hrsh7th/nvim-cmp",
	    dependencies = {
		    "lspkind.nvim",
        "L3MON4D3/LuaSnip",
		    "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
		    "hrsh7th/cmp-buffer", -- buffer auto-completion
		    "hrsh7th/cmp-path", -- path auto-completion
		    "hrsh7th/cmp-cmdline", -- cmdline auto-completion
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
	    },
      event = "InsertEnter",
	    config = function()
	    	require("plugins.config.cmp")
	    end,
    },
}
