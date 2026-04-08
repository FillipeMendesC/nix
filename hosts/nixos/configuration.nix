{ config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
  ];

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d --max-freed 1G"; 
    };
  };


  
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = false;
    grub = {
        enable = true;
        gfxmodeEfi = "1920x1200";
        gfxpayloadEfi = "keep";
        milk-theme.enable = true;
        device = "nodev";
        efiSupport = true;
      };
  };
  

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    xserver.videoDrivers = [ "nvidia" ];
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
    };
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true; 
    defaultNetwork.settings.dns_enabled = true;
  };

  users.users.eus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "podman" "docker"]; 
    initialPassword = "nixos"; 
  };

  environment = {
    systemPackages = with pkgs; [
      git
      curl
      docker-compose
    ];
    variables = {
      DOCKER_HOST = "unix:///run/user/1000/podman/podman.sock";
    };
  };
  
  time.timeZone = "America/Sao_Paulo";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "pt_BR.UTF-8/UTF-8"
    ];
  };

  system.stateVersion = "25.11"; 
}
