require("auto-save").setup({
  enabled = true,
  trigger_events = {
    immediate_save = { "BufLeave", "FocusLost" },
    defer_save = { "InsertLeave", "TextChanged" },
  },
  debounce_delay = 2000,
  condition = function(buf)
    local filetype = vim.bo[buf].filetype
    local buftype = vim.bo[buf].buftype

    -- Skip non-modifiable buffers
    if not vim.bo[buf].modifiable then
      return false
    end

    -- Skip special buftypes
    if buftype ~= "" then  -- "" means a normal file buffer
      return false
    end

    -- Skip specific filetypes
    local excluded_filetypes = {
      "gitcommit",
      "gitrebase",
      "hgcommit",
    }

    if vim.tbl_contains(excluded_filetypes, filetype) then
      return false
    end

    return true
  end,
})


