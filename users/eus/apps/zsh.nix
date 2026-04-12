{ pkgs, config, ... }: {

  programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];

      shellAliases = {
        ll = "ls -l";
        nixos-reload = "sudo nixos-rebuild switch --flake /home/eus/nix/";
        home-reload = "home-manager switch --flake /home/eus/nix/";
      };

      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };

      initContent = ''
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      '';
    };
}
  