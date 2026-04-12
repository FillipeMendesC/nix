{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "MesloLGS NF";
      size = 12;
    };
    
    settings = {
      confirm_os_window_close = 0;
      background_opacity = "0.9"; 
      scrollback_lines = 10000;
      enable_audio_bell = false;

      shell = "${pkgs.zsh}/bin/zsh";
      
      window_padding_width = 4;
      
      shell_integration = "enabled";
    };

    themeFile = "cherry-midnight";
  };
}