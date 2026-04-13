{ ... }:
{

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  environment.variables = {
    DOCKER_HOST = "unix:///run/user/1000/podman/podman.sock";
  };
}
