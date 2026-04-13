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

    # Hardware Modules
    ../../modules/nixos/hardware/nvidia.nix
    ../../modules/nixos/hardware/graphics.nix
    ../../modules/nixos/hardware/ssd.nix
    ../../modules/nixos/hardware/audio.nix

    # Desktop
    ../../modules/nixos/desktop/plasma.nix
    ../../modules/nixos/desktop/gaming.nix
    ../../modules/nixos/desktop/wayland.nix
    ../../modules/nixos/desktop/fonts.nix

  ];

  system.stateVersion = "25.11";
}
