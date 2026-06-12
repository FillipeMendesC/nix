require('persistence').setup {
  dir = vim.fn.expand(vim.fn.stdpath('state') .. '/sessions/'),
  options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "terminal" },
  pre_save = function()
    pcall(vim.cmd, 'tabdo NvimTreeClose')
  end,
}