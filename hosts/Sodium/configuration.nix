{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./disko.nix
    ./hardware-configuration.nix
    ../common/core
    ../common/users/banhcam.nix
    ../common/extras/amdgpu.nix
    ../common/extras/audio.nix
    ../common/extras/blender.nix
    ../common/extras/bluetooth.nix
    ../common/extras/docker.nix
    ../common/extras/fcitx5.nix
    ../common/extras/fonts.nix
    ../common/extras/plasma.nix
    ../common/extras/lanzaboote.nix
    ../common/extras/nixld.nix
    ../common/extras/nixpkgs.nix
    ../common/extras/nvidia.nix
    ../common/extras/steam.nix
    ../common/extras/tlp.nix
    ../common/extras/variables.nix
  ];

  environment.systemPackages = with pkgs; [
    alejandra
    android-studio
    docker-compose
    godot_4
    nil
    nixd
    prismlauncher
  ];

  programs = {
  };

  services = {
    flatpak.enable = true;
  };

  users.users.banhcam.extraGroups = lib.mkAfter ["docker"];

  home-manager.users."banhcam" = import ../../home/banhcam/Sodium.nix;

  networking.hostName = "Sodium";

  system.stateVersion = "24.11";
}
