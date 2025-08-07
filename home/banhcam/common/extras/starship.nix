{pkgs, ...}: {
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
      add_newline = true;
    };
  };
}
