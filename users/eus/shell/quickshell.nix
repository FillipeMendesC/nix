{ ... }: {

  programs.quickshell.enable = true;

  xdg.configFile."quickshell" = {
    source = ./.; 
    recursive = true;
  };

#  wayland.windowManager.hyprland.settings.exec-once = [
#    "quickshell"
#  ];
}