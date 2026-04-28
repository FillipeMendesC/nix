{ ... }: {
  programs.yazi = {
  enable = true;
  enableZshIntegration = true;
  settings = {
    manager = {
      show_hidden = true;
      sort_by = "natural";
      };
    };
  };

  xdg.mimeApps.associations.added = {
    "inode/directory" = [ "yazi.desktop" ];
  };
}