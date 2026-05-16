return {
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
    },
  },

  { -- preview equations
    "jbyuki/nabla.nvim",
    keys = {
      { "<leader>qm", ':lua require"nabla".toggle_virt()<cr>', desc = "toggle [m]ath equations" },
    },
  },
}
