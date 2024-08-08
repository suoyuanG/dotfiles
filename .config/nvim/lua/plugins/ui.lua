return {
  {
    "rebelot/heirline.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-lua/lsp-status.nvim",
    },
    config = function()
        require("plugins.config.ui_bar_light")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function ()
      require("plugins.config.ui_fs_tree")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function ()
     require('gitsigns').setup()
    end
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
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
    'rcarriga/nvim-notify',
  },
}
