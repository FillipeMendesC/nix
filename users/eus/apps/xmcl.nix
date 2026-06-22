{ pkgs, inputs, ... }: {
  imports = [
    inputs.xmcl.homeModules.xmcl
  ];

  programs.xmcl = {
    enable = true;
    commandLineArgs = [
      "--password-store=\"kwallet6\""
    ];
    jres = [
      pkgs.temurin-jre-bin-21
    ];
  }; 
}