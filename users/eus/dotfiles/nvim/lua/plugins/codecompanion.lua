require('codecompanion').setup({
  strategies = {
    chat = { adapter = 'copilot' },
    inline = { adapter = 'copilot' },
    agent = { adapter = 'copilot' },
  },
  display = {
    chat = {
      window = {
        layout = 'vertical',
        position = 'right',
      },
    },
  },
})
