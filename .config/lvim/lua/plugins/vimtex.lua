local M = {
  "lervag/vimtex",
}

M.config = function()
  vim.g.vimtex_view_method = "zathura"
  vim.g.latexmk_compiler_options = {
    options = {
      "-file-line-error",
      "-synctex=1",
      "-shell-escape",
      "-interaction=nonstopmode",
      "-verbose",
    },
  }
end

return M
