return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      flavour = "frappe", -- opts are "latte", "frappe", "macchiato", and "mocha"
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    name = "tokyonight",
    opts = {
      style = "moon", -- storm, moon, day, night
    },
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    name = "onedark",
    opts = {
      style = "dark",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-storm",
    },
  },
}
