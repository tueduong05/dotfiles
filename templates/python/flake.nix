{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {...} @ inputs: let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forEachSupportedSystem = f:
      inputs.nixpkgs.lib.genAttrs supportedSystems (system: let
        pkgs = import inputs.nixpkgs {
          inherit system;
        };
        python = pkgs.python312;
      in
        f {
          inherit pkgs python;
        });
  in {
    devShells = forEachSupportedSystem ({
      pkgs,
      python,
    }: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          python
          uv
        ];
        env =
          {
            UV_PYTHON_DOWNLOADS = "never";
            UV_PYTHON = python.interpreter;
          }
          // pkgs.lib.optionalAttrs pkgs.stdenv.isLinux {
            LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath pkgs.pythonManylinuxPackages.manylinux1;
          };
        shellHook = ''
          unset PYTHONPATH
        '';
      };
    });
  };
}
