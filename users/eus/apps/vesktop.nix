{ pkgs, ... }: {
  home.packages = [
    (pkgs.vesktop.overrideAttrs (oldAttrs: {
      makeWrapperArgs = (oldAttrs.makeWrapperArgs or []) ++ [
        "--set TZ America/Sao_Paulo"
      ];
    }))
  ];
}