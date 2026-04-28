{ ... }:
{
  programs.vscode = {
    enable = true;

    profiles.default.userSettings = {
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.serverSettings" = {
        nixd = {
          formatting = {
            command = [ "nixfmt" ];
          };

          nixpkgs = {
            expr = "import (builtins.getFlake \"/home/eus/nix\").inputs.nixpkgs { }";
          };

          options = {
            nixos = {
              expr = "(builtins.getFlake \"/home/eus/nix\").nixosConfigurations.nixos.options";
            };
            home-manager = {
              expr = "(builtins.getFlake \"/home/eus/nix\").nixosConfigurations.nixos.options.home-manager.users.type.getSubOptions []";
            };
          };
        };
      };
    };
  };
}
