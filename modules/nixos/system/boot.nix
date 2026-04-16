{ ... }:
{
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

    resumeDevice = "/dev/disk/by-uuid/dcfcffb9-9317-48be-8338-fb0cae646d16";
  };
}
