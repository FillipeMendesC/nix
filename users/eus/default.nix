{ pkgs, ... }:
{

  programs.zsh.enable = true;

  users.users.eus = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "podman"
      "docker"
      "gamemode"
      "video"
      "render"
    ];
    shell = pkgs.zsh;
  };

}
