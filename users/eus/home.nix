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
    ./apps/yazi.nix
    ./apps/zoxide.nix
    ./apps/pycharm.nix
    ./apps/hyprland/hyprland.nix
    ./apps/hyprland/hyprcursor.nix
    ./apps/hyprland/hyprlock.nix
    ./apps/hyprland/hypridle.nix
    ./apps/hyprland/waybar.nix
    ./apps/hyprland/wlogout.nix
    ./apps/hyprland/mako.nix
    ./services/kwallet.nix
    ./services/qt.nix
    ./shell/quickshell.nix
    ./scripts/scripts.nix
    ./apps/rmpc.nix
  ];

  home.username = "eus";
  home.homeDirectory = "/home/eus";

  home.packages = with pkgs; [
    neovim
    (jetbrains.idea.override { 
      vmopts = ''
        -Xmx4096m
        -Dawt.toolkit.name=WLToolkit
      ''; 
    })
    jetbrains.idea-oss
    jdk21
    maven
    nodejs_24
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
    hyprpaper
    wl-clipboard
    thunar
    kdePackages.kate
    pavucontrol
    brightnessctl
    hyprpicker
    grimblast
    wf-recorder
    imv
    ffmpegthumbnailer
    todo
    eza
    nwg-displays
    btop-cuda
    networkmanagerapplet
    heroic
    jq
    libnotify
    bash
  ];


  home.stateVersion = "26.05";
}
