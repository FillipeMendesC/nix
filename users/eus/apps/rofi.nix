{ pkgs, config, ... }:

{
  stylix.targets.rofi.enable = false;

  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty -e";
    cycle = true;
    location = "center";
    
    extraConfig = {
      modi = "drun,window,filebrowser,run";
      show-icons = true;
      icon-theme = "Papirus-Dark";
      drun-display-format = "{name}";
      display-drun = "Apps";
      sidebar-mode = false;
      drun-show-actions = true;
    };

    theme = toString (pkgs.writeText "rofi-black.rasi" ''
      * {
        bg:            #0b0b0bff;
        bg-alt:        #111111ff;
        fg:            #f2f2f2ff;
        muted:         #b0b0b0ff;
        accent:        #5a00adff;
        border:        #1c1c1cff;
        urgent:        #ff5b5bff;
        font:          "JetBrains Mono 12";
        spacing:       8;
        background-color: @bg;
      }

      window {
        transparency: "real";
        location:     center;
        anchor:       center;
        width:        720px;
        border:       2px;
        border-radius: 14px;
        border-color: @border;
        background-color: @bg;
      }

      mainbox {
        padding: 20px;
        spacing: 12px;
        background-color: @bg;
      }

      inputbar {
        padding: 12px;
        spacing: 10px;
        border: 1px;
        border-radius: 10px;
        border-color: @accent;
        background-color: @bg-alt;
      }

      prompt {
        text-color: @muted;
      }

      entry {
        text-color: @fg;
        placeholder: "Search...";
        placeholder-color: @muted;
        background-color: @bg-alt;
      }

      listview {
        lines: 7;
        columns: 1;
        spacing: 6px;
        fixed-height: false;
        background-color: @bg;
      }

      element {
        padding: 10px;
        spacing: 10px;
        border-radius: 10px;
      }

      element normal.normal {
        background-color: @bg;
        text-color: @fg;
      }

      element normal.urgent {
        background-color: @bg;
        text-color: @urgent;
      }

      element normal.active {
        background-color: @bg;
        text-color: @accent;
      }

      element alternate.normal {
        background-color: @bg;
        text-color: @fg;
      }

      element alternate.urgent {
        background-color: @bg;
        text-color: @urgent;
      }

      element alternate.active {
        background-color: @bg;
        text-color: @accent;
      }

      element selected.normal {
        background-color: @bg-alt;
        text-color: @fg;
        border: 1px;
        border-color: @accent;
      }

      element selected.urgent {
        background-color: @bg-alt;
        text-color: @urgent;
        border: 1px;
        border-color: @urgent;
      }

      element selected.active {
        background-color: @bg-alt;
        text-color: @accent;
        border: 1px;
        border-color: @accent;
      }

      element-text {
        text-color: inherit;
        background-color: transparent;
      }

      element-icon {
        size: 24px;
        text-color: inherit;
        background-color: transparent;
      }

      textbox {
        text-color: @fg;
        background-color: transparent;
      }

      message {
        padding: 10px;
        border-radius: 10px;
        background-color: @bg-alt;
      }

      error-message {
        text-color: @urgent;
      }
    '');
  };
}
