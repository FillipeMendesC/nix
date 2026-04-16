{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --cmd 'uwsm start hyprland-session.target'";
        user = "greeter";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    tuigreet
  ];
}
