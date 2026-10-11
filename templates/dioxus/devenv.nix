{ pkgs, ... }:
{
  packages = [
    pkgs.dioxus-cli
  ];

  languages.rust = {
    channel = "stable";
    targets = [ "wasm32-unknown-unknown" ];
  };

  treefmt = {
    enable = true;
    config.programs = {
      nixfmt.enable = true;
      rustfmt.enable = true;
      taplo.enable = true;
    };
  };

  git-hooks.hooks = {
    treefmt.enable = true;
    clippy = {
      enable = true;
      settings = {
        allFeatures = true;
        offline = false;
        denyWarnings = true;
        extraArgs = "--all-targets";
      };
    };
  };
}
