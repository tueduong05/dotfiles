{...}: let
  modifications = final: prev: {
    brave = prev.brave.override {
      commandLineArgs = "--enable-wayland-ime";
    };
  };
in {
  default = final: prev: (modifications final prev);
}
