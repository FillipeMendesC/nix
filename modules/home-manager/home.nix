{ pkgs, inputs, config, ... }: {
  imports = [
    ./apps/vesktop.nix
    ./apps/kitty.nix
  ];

  home.username = "eus";
  home.homeDirectory = "/home/eus";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    git
    neovim
    jetbrains.idea
    jetbrains.idea-oss
    jdk21
    maven
    nodejs_24
    vscode
    corepack
    mangohud
    gamemode
    protonup-qt
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    gh
    obsidian
    bruno
  ];

  programs = {
    git = {
      enable = true;
      settings = {
        user.email = "fillipemcoelho@hotmail.com";
        user.name  = "FillipeMendesC";
        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];

      shellAliases = {
        ll = "ls -l";
        nixos-reload = "sudo nixos-rebuild switch --flake /home/eus/nix/";
        home-reload = "home-manager switch --flake /home/eus/nix/";
      };

      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };

      initContent = ''
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      '';
    };
  };

  home.stateVersion = "25.11"; 
}
