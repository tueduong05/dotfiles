{
  lib,
  pkgs,
  ...
}: {
  imports = lib.custom.scanPath ./.;

  home = {
    username = "banhcam";
    homeDirectory = "/home/banhcam";
    stateVersion = "24.11";
    packages = with pkgs; [
      bzip3
      curl
      openssh
      unrar
      unzip
      wget
      zip
    ];
  };

  programs = {
    home-manager.enable = true;

    btop.enable = true;
    carapace.enable = true;
    fastfetch.enable = true;
    fzf.enable = true;
    jq.enable = true;
    lazygit.enable = true;
    ripgrep.enable = true;
  };

  systemd.user.startServices = "sd-switch";
}
