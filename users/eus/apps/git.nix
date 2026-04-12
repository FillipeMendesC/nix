{ ... }: {
  programs = {
    git = {
      enable = true;
      settings = {
        user.email = "fillipemcoelho@hotmail.com";
        user.name  = "FillipeMendesC";
        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };

    gh = {
      enable = true;
      settings = {
        git_protocol = "https";
      };
    };
  };
}