{ config, ... }:
{
  languages.python = {
    enable = true;
    libraries = [
      "${config.devenv.dotfile}/profile"
      "/run/opengl-driver"
    ];
    uv.enable = true;
  };
}
