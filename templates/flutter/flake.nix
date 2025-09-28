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
          cmakeVersions = ["3.22.1"];
          includeNDK = true;
          ndkVersions = ["27.0.12077973"];
          extraLicenses = [
            "android-googletv-license"
            "android-googlexr-license"
            "android-sdk-arm-dbt-license"
            "android-sdk-license"
            "android-sdk-preview-license"
            "google-gdk-license"
            "mips-android-sysimage-license"
          ];
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
          mesa-demos
        ];

        env = {
          ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
        };
      };
    });
  };
}
