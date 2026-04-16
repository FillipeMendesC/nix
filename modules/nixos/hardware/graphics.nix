{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      intel-media-driver # Modern Intel media driver
      nvidia-vaapi-driver # NVIDIA VA-API support
      libvdpau-va-gl
    ];
  };
}
