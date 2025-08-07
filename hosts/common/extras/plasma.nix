{pkgs, ...}: {
  services = {
    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
    };

    displayManager.sddm = {
      enable = true;
      enableHidpi = true;
      wayland.enable = true;
    };

    desktopManager.plasma6.enable = true;
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    gwenview
    kate
    konsole
    okular
  ];
}
