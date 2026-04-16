{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.kwallet
    kdePackages.kwallet-pam
    kdePackages.kwalletmanager
    libsecret
  ];

  xdg.configFile."kwalletrc".text = ''
    [Wallet]
    Enabled=true
    First Use=false

    [org.freedesktop.secrets]
    apiEnabled=true
  '';
}
