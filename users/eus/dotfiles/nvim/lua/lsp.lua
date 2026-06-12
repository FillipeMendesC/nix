local lsp = vim.lsp
local capabilities = require('blink.cmp').get_lsp_capabilities()

lsp.config('basedpyright', {
  cmd = { 'basedpyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', '.git' },
  capabilities = capabilities,
  settings = {
    basedpyright = { 
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = 'workspace',
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
      },
    },
  },
})

lsp.config('ty', {
  cmd = { 'ty', 'server' },
    filetypes = { 'python' },
    root_markers = { 'ty.toml', 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
})

lsp.config('ruff', {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', '.git' },
})

lsp.config('nixd', {
  cmd = { 'nixd' },
  filetypes = { 'nix' },
  root_markers = { 'flake.nix', '.git' },
  settings = {
    nixd = {
      nixpkgs = {
        expr = 'import <nixpkgs> {}',
      },
      options = {
        nixos = {
          expr = '(builtins.getFlake "/home/eus/nix").nixosConfigurations.nixos.options',
        },
        ["home-manager"] = {
          expr = '(builtins.getFlake "/home/eus/nix").nixosConfigurations.nixos.options.home-manager.users.type.getSubOptions []',
        },
      },
    },
  },
})

lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.git', 'init.lua', '.luarc.json', '.luarc.jsonc' },
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

lsp.config('qmlls', {
  cmd = { 'qmlls' },
  filetypes = { 'qml', 'qmljs' },
  root_markers = { '.git', 'CMakeLists.txt', 'qmlproject', 'qmldir' },
})

lsp.config('sqls', {
  cmd = { 'sqls' },
  filetypes = { 'sql' },
  root_markers = { '.git' },
})

lsp.config('yamlls', {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml' },
  root_markers = { '.git' },
})

lsp.config('marksman', {
  cmd = { 'marksman', 'server' },
  filetypes = { 'markdown', 'markdown.mdx' },
  root_markers = { '.git', '.marksman.toml' },
})

lsp.enable({ 'basedpyright', 'ty', 'ruff', 'nixd', 'lua_ls', 'qmlls', 'sqls', 'yamlls', 'marksman' })
