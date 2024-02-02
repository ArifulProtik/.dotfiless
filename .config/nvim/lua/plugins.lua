return {

  -- For Rust Lsp Server Tools (Not Much Configuration Needed)
  {
    'mrcjkb/rustaceanvim',
    version = '^3', -- Recommended
    ft = { 'rust' },
  },

  -- For Golang Other GOPLS Tools
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },

  -- Better Diagonistics
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
  },


}
