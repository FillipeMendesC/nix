{ pkgs, ... }:
{

  fonts.packages = with pkgs; [
    inter
    nerd-fonts.jetbrains-mono
    iosevka
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  fonts.fontconfig = {
    antialias = true;
    hinting = {
      enable = true;
      style = "slight";
    };
    subpixel = {
      rgba = "rgb";
      lcdfilter = "default";
    };
  };

}
