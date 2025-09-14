{pkgs, ...}: {
  imports = [
    ./common/core
    ./common/extras/distrobox.nix
    ./common/extras/flatpak.nix
    ./common/extras/ghostty.nix
    ./common/extras/starship.nix
    ./common/extras/zed.nix
  ];

  home.packages = with pkgs; [
    brave
    obsidian
  ];

  services = {
    mpris-proxy.enable = true;
  };
}
