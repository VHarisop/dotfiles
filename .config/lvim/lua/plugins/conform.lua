return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        tex = { "latexindent" },
        -- Ensure Python uses Ruff
        python = { "ruff" },
      },
    },
  },
}
