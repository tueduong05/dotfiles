{...}: {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
    };

    direnv.enableZshIntegration = true;
    eza.enableZshIntegration = true;
    fzf.enableZshIntegration = true;
    keychain.enableZshIntegration = true;
    zoxide.enableZshIntegration = true;
  };
}
