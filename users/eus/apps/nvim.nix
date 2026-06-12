{ pkgs, config, ... }: {
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    waylandSupport = true;
    defaultEditor = true;
    sideloadInitLua = true;

    plugins = with pkgs.vimPlugins; [
      plenary-nvim
      nui-nvim
      nvim-web-devicons
      nvim-lspconfig

      dashboard-nvim
      neo-tree-nvim
      lualine-nvim
      noice-nvim
      nvim-notify 
      nvim-colorizer-lua
      smartcolumn-nvim
      vim-illuminate
      (nvim-treesitter.withPlugins (p: [
        p.bash
        p.lua
        p.markdown
        p.markdown_inline
        p.nix
        p.python
        p.query
        p.regex
        p.sql
        p.vim
        p.vimdoc
        p.yaml
        p.zsh
      ]))

      telescope-nvim
      telescope-ui-select-nvim

      gitsigns-nvim
      blink-cmp
      luasnip

      nvim-autopairs
      comment-nvim
      which-key-nvim
      bufdelete-nvim

      direnv-vim

      nvim-dap
      nvim-dap-ui
      nvim-nio

      copilot-lua
      codecompanion-nvim

      persistence-nvim
      auto-save-nvim
    ];

    extraPackages = with pkgs; [
      # Treesitter & system utilities
      tree-sitter
      gcc
      gnumake
      
      # LSPs & Formatters
      ty
      basedpyright
      ruff
      nixd
      nixfmt
      lua-language-server
      stylua
      qt6.qtdeclarative
      sqls
      yaml-language-server
      marksman

      # Python Debugging
      python3Packages.debugpy

      # Telescope dependencies
      ripgrep
      fd
      
      # Assistant (Copilot) & Clipboard support
      nodejs
      wl-clipboard
    ];
  };

    xdg.configFile."nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink /home/eus/nix/users/eus/dotfiles/nvim;
      recursive = true;
    };
}
