return {
    {
        "williamboman/mason.nvim",
        config = function()
            require('plugins.config.lsp')
        end,
    },

	"williamboman/mason-lspconfig.nvim",
  {
    "neovim/nvim-lspconfig",
    opts = function ()
--      require('plugins.config.lsp_config_opt')
    end,
    config = function ()
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        build = ':TSUpdate',
        -- prevent flickering when opening file
        event = 'BufRead',
        cond = vim.g.is_not_large,
        config = function()
          require('plugins.config.treesitter')
        end,
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require('plugins.config.none-ls')
    end
  },
  {
  "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  }
}
