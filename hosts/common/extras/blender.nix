{
  inputs,
  lib,
  pkgs,
  ...
}: {
  nixpkgs.overlays = lib.mkAfter [inputs.blender-bin.overlays.default];

  environment.systemPackages = with pkgs; [
    blender
  ];
}
