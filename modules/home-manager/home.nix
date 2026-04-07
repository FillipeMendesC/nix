{ pkgs, inputs ... }: {

  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  home.username = "eus";
  home.homeDirectory = "/home/eus";

  home.packages = with pkgs; [
    git
    neovim
    jetbrains.idea-ultimate
    jetbrains.idea-community
    jdk21
    maven
    nodejs_26 
    corepack
    Vesktop
    mangohud
    gamemode
    protonup-qt
  ];

  programs.git = {
    enable = true;
    userName = "";
    userEmail = "";
  };

  home.stateVersion = "25.11"; 
}