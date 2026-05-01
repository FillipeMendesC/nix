{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      intel-media-driver
      nvidia-vaapi-driver
      libvdpau-va-gl
    ];
  };
}
