{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.symlinkJoin {
      name = "vscode-no-nvidia";
      pname = pkgs.vscode.pname;
      version = pkgs.vscode.version;

      paths = [ pkgs.vscode ];
      nativeBuildInputs = [ pkgs.makeWrapper ];

      postBuild = ''
        wrapProgram $out/bin/code \
        --set __GLX_VENDOR_LIBRARY_NAME mesa \
        --set DRI_PRIME 0 \
        --set MESA_LOADER_DRIVER_OVERRIDE iris \
        --unset __NV_PRIME_RENDER_OFFLOAD \
        --unset __NV_PRIME_RENDER_OFFLOAD_PROVIDER \
        --add-flags "--ozone-platform=wayland"
      '';
    };
  };
}
