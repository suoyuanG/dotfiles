return {
  {
    "rebelot/heirline.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-lua/lsp-status.nvim",
    },
    config = function()
      require("plugins.config.ui_bar_dark")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      require("plugins.config.notify")
    end
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
  },
  {
    'echasnovski/mini.files',
    version = '*',
    dependencies = {
      {
        'echasnovski/mini.icons',
        version = '*',
        config = function()
          require('mini.icons').setup()
        end
      }
    },
    config = function()
      require('mini.files').setup()
    end
  },
}
