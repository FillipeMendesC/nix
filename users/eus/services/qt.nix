{ pkgs, ... }: {
  qt = {
    enable = true;
    # Stylix does it
    #platformTheme.name = "kvantum";
    #style.name = "kvantum";
  };

  home.packages = with pkgs; [
    qt6.qtwayland
  ];
}