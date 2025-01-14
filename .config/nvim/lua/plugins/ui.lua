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
    'rcarriga/nvim-notify',
      opts = {
      stages = 'fade',
      level = 'DEBUG',
      timeout = 150,
      fps = 20,
      max_height = function() return math.floor(vim.o.lines * 0.50) end,
      max_width = function() return math.floor(vim.o.columns * 0.45) end,
      on_open = function(win) vim.api.nvim_win_set_config(win, { focusable = false }) end
    },
    config = function ()
      vim.notify = require("notify")
    end
  },
}
