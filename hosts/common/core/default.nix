{
  lib,
  pkgs,
  ...
}: {
  imports = lib.custom.scanPath ./.;

  environment.systemPackages = with pkgs; [
    just
    sl
  ];

  services = {
    earlyoom.enable = true;
  };

  zramSwap.enable = true;
}
