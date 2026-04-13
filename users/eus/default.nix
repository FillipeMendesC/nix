{ pkgs, ... }: {

  programs.zsh.enable = true;

  users.users.eus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "podman" "docker" "gamemode" ]; 
    shell = pkgs.zsh;
  };

}