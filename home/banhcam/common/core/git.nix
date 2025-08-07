{...}: {
  programs.git = {
    enable = true;
    userName = "Thong Tue Duong";
    userEmail = "tueduong005@gmail.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      commit.gpgsign = true;
      gpg.format = "ssh";
      pull.rebase = true;
      push.autoSetupRemote = true;
      user.signingkey = "/home/banhcam/.ssh/id_ed25519.pub";
    };
  };
}
