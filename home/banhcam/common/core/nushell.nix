{pkgs, ...}: {
  programs = {
    nushell = {
      enable = true;
      extraConfig = ''
        let carapace_completer = {|spans: list<string>|
          carapace $spans.0 nushell ...$spans
          | from json
          | if ($in | default [] | where value == $"($spans | last)ERR" | is-empty) { $in } else { null }
        }
        $env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'

        $env.config = {
          show_banner: false
          completions: {
            case_sensitive: false
            quick: true
            partial: true
            algorithm: "fuzzy"
            external: {
              enable: true
              max_results: 10
              completer: $carapace_completer
            }
          }
        }

        $env.PATH = ($env.PATH |
          split row (char esep) |
          prepend /home/banhcam/.apps |
          append /usr/bin/env
        )
      '';
    };

    carapace.enableNushellIntegration = true;
    direnv.enableNushellIntegration = true;
    eza.enableNushellIntegration = true;
    keychain.enableNushellIntegration = true;
    zoxide.enableNushellIntegration = true;
  };
}
