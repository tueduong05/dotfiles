{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    blender-bin.url = "github:edolstra/nix-warez?dir=blender";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    flake-compat,
    ...
  } @ inputs: let
    forAllSystems = nixpkgs.lib.genAttrs [
      "x86_64-linux"
    ];

    lib = nixpkgs.lib.extend (self: super: {custom = import ./lib {inherit (nixpkgs) lib;};});
  in {
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays {inherit inputs;};

    nixosConfigurations = {
      Sodium = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs lib;};
        modules = [./hosts/Sodium/configuration.nix];
      };
    };
  };
}
