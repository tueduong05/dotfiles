{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];

  users.users.banhcam = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    initialPassword = "onetwothree";
    shell = pkgs.nushell;
  };

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs;};
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  nix.settings.trusted-users = lib.mkAfter ["banhcam"];
}
