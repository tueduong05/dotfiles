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
          config = {
            allowUnfree = true;
            android_sdk.accept_license = true;
          };
        };
        androidComposition = pkgs.androidenv.composeAndroidPackages {
          buildToolsVersions = ["35.0.0"];
          platformVersions = ["36"];
          abiVersions = ["arm64-v8a" "armeabi-v7a" "x86_64"];
        };
        androidSdk = androidComposition.androidsdk;
      in
        f {
          inherit pkgs androidSdk;
        });
  in {
    devShells = forEachSupportedSystem ({
      pkgs,
      androidSdk,
    }: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          androidSdk
          flutter
          jdk21
        ];
        env = {
          ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
        };
      };
    });
  };
}
