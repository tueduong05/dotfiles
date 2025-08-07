{inputs, ...}: {
  imports = [inputs.nix-flatpak.homeManagerModules.nix-flatpak];

  services.flatpak = {
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];

    update.auto.enable = true;
    uninstallUnmanaged = true;

    packages = [
    ];

    overrides = {
      global = {
        Context.sockets = ["wayland" "!x11" "!fallback-x11"];
      };
    };
  };
}
