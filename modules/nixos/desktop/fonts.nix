{ pkgs, ... }:
{

  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
    cascadia-code
    jetbrains-mono
    fira-code
    iosevka
    noto-fonts
  ];

}
