{...}: {
  services.mpd = {
    enable = true;
    network.listenAddress = "localhost";
    network.port = 6600;
  };
  programs.yt-dlp.enable = true;
  programs.rmpc = {
    enable = true;
    settings = {
      host = "localhost";
      port = 6600;
      cacheDir = "$HOME/.cache/rmpc";
    };
  };
}