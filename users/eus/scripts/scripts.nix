{ ... }: {
  home.file.".config/hypr/scripts/toggle-touchpad.sh" = {
    source = ./toggle-touchpad.sh;  
    executable = true;
  };
}