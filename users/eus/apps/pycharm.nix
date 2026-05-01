{ pkgs, inputs, ... }:

let
  jetbrains-lib = inputs.nix-jetbrains-plugins.lib;
in
{
  home.packages = [
    (jetbrains-lib.buildIdeWithPlugins pkgs "pycharm" [
      "com.github.copilot"        
      "nix-idea"                     
      "com.koxudaxi.pydantic"       
      "ru.adelf.idea.dotenv"  
      "izhangzhihao.rainbow.brackets"
      "com.jetbrains.plugins.webDeployment" 
    ])
  ];
}

      