{ pkgs, ... }:
{
  languages.rust.enable = true;

  packages = [
    pkgs.bacon
    pkgs.cargo-nextest
    pkgs.cargo-workspaces
    pkgs.watchexec
  ];
}
