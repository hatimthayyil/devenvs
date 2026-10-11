{ pkgs, ... }:
{
  packages = [
    pkgs.cargo-tauri
    pkgs.gobject-introspection
    pkgs.pkg-config

    pkgs.at-spi2-atk
    pkgs.atkmm
    pkgs.cairo
    pkgs.gdk-pixbuf
    pkgs.glib
    pkgs.gtk3
    pkgs.harfbuzz
    pkgs.librsvg
    pkgs.libsoup_3
    pkgs.openssl
    pkgs.pango
    pkgs.webkitgtk_4_1
  ];
}
