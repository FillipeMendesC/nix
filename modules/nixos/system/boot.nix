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

    kernelParams = [
      "i915.enable_guc=3"
      "i915.enable_fbc=1"
      "nvidia.NVreg_DynamicPowerManagement=0x02"
      "nvidia.NVreg_EnableS0ixPowerManagement=1"
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    ];

    resumeDevice = "/dev/disk/by-uuid/dcfcffb9-9317-48be-8338-fb0cae646d16";
  };
}
