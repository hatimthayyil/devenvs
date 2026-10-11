{ pkgs, lib, ... }:
let
  libraries = [
    pkgs.libGL
    pkgs.libxkbcommon
    pkgs.vulkan-loader
    pkgs.wayland
    pkgs.libx11
    pkgs.libxcursor
    pkgs.libxi
    pkgs.libxrandr
  ];
in
{
  packages = [ pkgs.pkg-config ] ++ libraries;

  env.LD_LIBRARY_PATH = lib.makeLibraryPath libraries;
}
