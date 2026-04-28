{ ... }:
{

  imports = [

    # Host config
    ./hardware-configuration.nix
    ./battery.nix

    # User Config
    ../../users/eus/default.nix

    # System Modules
    ../../modules/nixos/system/boot.nix
    ../../modules/nixos/system/locale.nix
    ../../modules/nixos/system/networking.nix
    ../../modules/nixos/system/virtualisation.nix
    ../../modules/nixos/system/nix.nix
    ../../modules/nixos/system/security.nix
    ../../modules/nixos/system/usb.nix

    # Hardware Modules
    ../../modules/nixos/hardware/nvidia.nix
    ../../modules/nixos/hardware/graphics.nix
    ../../modules/nixos/hardware/ssd.nix
    ../../modules/nixos/hardware/audio.nix

    # Desktop
    #../../modules/nixos/desktop/plasma.nix
    ../../modules/nixos/desktop/gaming.nix
    ../../modules/nixos/desktop/wayland.nix
    ../../modules/nixos/desktop/fonts.nix
    ../../modules/nixos/desktop/hyprland.nix
    ../../modules/nixos/desktop/greetd.nix
    ../../modules/nixos/desktop/stylix.nix

  ];

  system.stateVersion = "26.05";
}
