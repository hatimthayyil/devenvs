# AGENTS.md

Shared devenv package sets and project templates, imported by projects through a `devenvs` input.

## Layout
- `<set>/devenv.nix`: one package set per directory, a plain devenv module. Projects import it as `devenvs/<set>`.
- `templates/<name>/`: project scaffolds, listed in `flake.nix` `templates`.

## Rules
- A set holds what projects repeat: toolchains, build libraries, project CLIs. Desktop programs belong in the NixOS config (`/hatimthayyil/code/config`).
- Sets are functions of the project's `pkgs`; they never pin nixpkgs.
- Sets do not import each other; projects list every set they use.
- Templates import sets rather than copying their contents.

## Commands
- `devenv shell -- check`: build every set's shell.
- Test a template: copy it to a scratch dir, `git init`, then `devenv -o devenvs path:<this repo> shell`.
