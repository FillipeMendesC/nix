vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local prefer = { python = "ruff" }
    local ft = vim.bo.filetype
    vim.lsp.buf.format({
      async = false,
      name = prefer[ft],
    })
  end,
})