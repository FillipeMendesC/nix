{ config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./battery.nix
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

  boot = {
    loader = {
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

    kernelParams = [ 
      "i915.enable_guc=3" 
      "i915.enable_fbc=1"
      "nvidia.NVreg_DynamicPowerManagement=0x02"
      "nvidia.NVreg_EnableS0ixPowerManagement=1"
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    ];
    resumeDevice = "/dev/nvme0n1p3";
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    xserver.videoDrivers = [ "nvidia" ];
    switcherooControl.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
    };
    gamescope.enable = true;
    zsh.enable = true;
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        intel-media-driver 
        intel-vaapi-driver
        libvdpau-va-gl
      ];
    };
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = true;
      powerManagement= {
        enable = true;
        finegrained = true;
      };
      prime = {
        offload.enable = true;
        offload.enableOffloadCmd = true;
        intelBusId  = "PCI:0@0:2:0"; 
        nvidiaBusId = "PCI:1@0:0:0";
      };
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
    shell = pkgs.zsh;
  };

  environment = {
    systemPackages = with pkgs; [
      git
      curl
      docker-compose
    ];
    variables = {
      DOCKER_HOST = "unix:///run/user/1000/podman/podman.sock";
      DRI_PRIME = "1";
    };
    sessionVariables = {
      EGL_PLATFORM = "wayland";
      NIXOS_OZONE_WL = "1";
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
  ];
 
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

  swapDevices = [ { device = "/dev/nvme0n1p3"; } ];

  system.stateVersion = "25.11"; 
}
