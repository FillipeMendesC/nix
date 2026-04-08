{ pkgs, inputs, ... }: {
  imports = [
    ./apps/vesktop.nix
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

  programs.git = {
    enable = true;
    settings = {
      user.email = "fillipemcoelho@hotmail.com";
      user.name  = "FillipeMendesC";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  home.stateVersion = "25.11"; 
}
