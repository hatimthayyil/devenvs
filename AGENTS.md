# AGENTS.md

Layout and usage are in `README.md`.

## Rules
- An environment holds what projects repeat: toolchains, build libraries, project CLIs.
- Environments are functions of the project's `pkgs`.
- Each environment stands alone; projects list every one they use.
- Templates import environments.
- Add each new environment or template to `README.md`, and each new template to `flake.nix`.
- Test a template in a scratch copy: `git init`, then `devenv -o dev path:<checkout> shell`.
