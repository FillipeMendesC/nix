{ pkgs, lib, ... }:
{
  stylix = {
    enable = true;
    image = ../../../assets/wallpapers/wallhaven-3q5g5v_1920x1200.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/horizon-terminal-dark.yaml";
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      sizes = {
        terminal = 12;
        applications = 12;
      };
    };
    opacity = {
      terminal = 0.9;
      desktop = 0.9;
      popups = 1.0;
    };
    targets = {
      grub.enable = lib.mkDefault false;
    };
    polarity = "dark";
  };
}
