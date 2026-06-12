{ pkgs, inputs, ... }:
{
  programs.home-manager.enable = true;

  imports = [
    inputs.nvf.homeManagerModules.default
    ./config
    ./services
    ./apps/vesktop.nix
    ./apps/kitty.nix
    ./apps/ns-build.nix
    ./apps/zsh.nix
    ./apps/git.nix
    ./apps/vscode.nix
    ./apps/yazi.nix
    ./apps/zoxide.nix
    ./apps/pycharm.nix
    ./apps/nvim.nix
    ./wm/hyprland/hyprland.nix
    ./shell/quickshell.nix
    ./scripts/scripts.nix
    ./apps/rmpc.nix
    ./apps/rofi.nix
    ./apps/direnv.nix
  ];

  home.username = "eus";
  home.homeDirectory = "/home/eus";

  home.packages = with pkgs; [
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
    waybar
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
    yt-dlp
    jmeter
    ripgrep
    fd
    super-productivity
    peazip
    p7zip-rar
    unrar
    unzip
    zip
    lz4
    tree-sitter
    qbittorrent
    winetricks
    wine
    gamescope
    firefox
    obs-studio
  ];

  home.stateVersion = "26.05";
}
