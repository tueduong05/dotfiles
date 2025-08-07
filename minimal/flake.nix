{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: {
    nixosConfigurations = {
      Sodium = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [./configuration.nix];
      };
    };
  };
}
