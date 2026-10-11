# AGENTS.md

Shared devenv environments and project templates, imported by projects through a `dev` input.

## Layout
- `envs/<name>/devenv.nix`: one environment per directory, a plain devenv module. Projects import it as `dev/envs/<name>`.
- `templates/<name>/`: project scaffolds, listed in `flake.nix` `templates`.

## Rules
- An environment holds what projects repeat: toolchains, build libraries, project CLIs. Desktop programs belong in the NixOS config (`/hatimthayyil/code/config`).
- Environments are functions of the project's `pkgs`; they never pin nixpkgs.
- Environments do not import each other; projects list every one they use.
- Templates import environments rather than copying their contents.

## Commands
- `devenv shell -- check`: build every environment's shell.
- Test a template: copy it to a scratch dir, `git init`, then `devenv -o dev path:<this repo> shell`.
