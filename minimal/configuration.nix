{...}: {
  imports = [
    ./disko.nix
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  networking = {
    hostName = "Sodium";
    firewall.enable = true;
    networkmanager.enable = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Asia/Ho_Chi_Minh";

  users.users.banhcam = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    initialPassword = "onetwothree";
  };

  system.stateVersion = "24.11";
}
