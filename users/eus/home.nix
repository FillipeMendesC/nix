{ pkgs, inputs, config, ... }: 
{
  # Aqui a magica começa
  programs.home-manager.enable = true;

  imports = [
    ./apps/vesktop.nix
    ./apps/kitty.nix
    ./apps/ns-build.nix
    ./apps/zsh.nix
    ./apps/git.nix
  ];

  home.username = "eus";
  home.homeDirectory = "/home/eus";

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
    gamemode
    protonup-qt
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    gh
    obsidian
    bruno
    fzf
    nix-search-tv
    python3
  ];

  home.stateVersion = "25.11"; 
}
