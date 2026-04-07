{ config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  users.users.eus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; 
    initialPassword = "nixos"; 
  };

  environment.systemPackages = with pkgs; [
    git
    curl
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 3d --max-freed 1G"; 
  };

  nix.settings.auto-optimise-store = true;
  
  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "pt_BR.UTF-8/UTF-8"
  ];

    system.stateVersion = "25.11"; 
}
