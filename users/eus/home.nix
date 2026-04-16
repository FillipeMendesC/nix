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
    ./apps/hyprland/hyprland.nix
    ./apps/hyprland/waybar.nix
    ./apps/hyprland/wlogout.nix
    ./services/kwallet.nix
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
    nixd
    nixfmt
    vlc
    uv
    python3
    waybar
    wofi
    mako
    hyprpaper
    grim
    slurp
    wl-clipboard
    blueman
    kdePackages.dolphin
    kdePackages.kate
    pavucontrol
    brightnessctl
    hyprcursor
    hyprdim
    hyprlock
    pywal16
    hyprpicker
    grimblast
    wf-recorder
  ];

  home.stateVersion = "25.11";
}
