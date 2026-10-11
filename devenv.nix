{ pkgs, ... }:
{
  packages = [ pkgs.git ];

  scripts.check = {
    description = "Build every environment in a scratch project";
    exec = ''
      set -euo pipefail
      root=$(git rev-parse --show-toplevel)
      for set in "$root"/envs/*/devenv.nix; do
        name=$(basename "$(dirname "$set")")
        project=$(mktemp -d)
        printf 'inputs:\n  nixpkgs:\n    url: github:cachix/devenv-nixpkgs/rolling\n  dev:\n    url: path:%s\n    flake: false\nimports:\n  - dev/envs/%s\n' "$root" "$name" > "$project/devenv.yaml"
        echo '{ }' > "$project/devenv.nix"
        echo "== $name"
        (cd "$project" && devenv --no-tui build shell >/dev/null)
        rm -rf "$project"
      done
    '';
  };

  treefmt = {
    enable = true;
    config.programs = {
      nixfmt.enable = true;
      deadnix.enable = true;
      statix.enable = true;
    };
  };

  git-hooks.hooks = {
    treefmt.enable = true;
    shellcheck.enable = true;
  };
}
