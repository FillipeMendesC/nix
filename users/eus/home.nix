{ pkgs, inputs, ... }:
{
  programs.home-manager.enable = true;

  imports = [
    ./apps/vesktop.nix
    ./apps/kitty.nix
    ./apps/ns-build.nix
    ./apps/zsh.nix
    ./apps/git.nix
    ./apps/vscode.nix
  ];

  home.username = "eus";
  home.homeDirectory = "/home/eus";

  home.packages = with pkgs; [
    neovim
    jetbrains.idea
    jetbrains.idea-oss
    jdk21
    maven
    nodejs_24
    corepack
    protonup-qt
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    obsidian
    bruno
    fzf
    nix-search-tv
    python3
    nixd
    nixfmt
    vlc
  ];

  home.stateVersion = "25.11";
}
