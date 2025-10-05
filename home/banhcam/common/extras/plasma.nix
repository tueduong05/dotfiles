{inputs, ...}: {
  imports = [inputs.plasma-manager.homeModules.plasma-manager];

  programs.plasma = {
    enable = true;
    shortcuts = {
      "kwin"."Switch to Desktop 1" = "Meta+1";
      "kwin"."Switch to Desktop 2" = "Meta+2";
      "kwin"."Switch to Desktop 3" = "Meta+3";
      "kwin"."Switch to Desktop 4" = "Meta+4";
      "kwin"."Switch to Desktop 5" = "Meta+5";
    };
  };
}
