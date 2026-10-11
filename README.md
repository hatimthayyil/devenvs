# devenvs

Shared [devenv](https://devenv.sh) package sets and project templates.

## Sets

| Set | Provides |
|---|---|
| `rust` | Rust toolchain, bacon, cargo-nextest, cargo-workspaces, watchexec |
| `rust-gui` | Wayland, X11, Vulkan and OpenGL libraries on `LD_LIBRARY_PATH`, pkg-config |
| `tauri` | cargo-tauri and the GTK and WebKitGTK build libraries |
| `python-cuda` | Python with uv, NVIDIA driver libraries from `/run/opengl-driver` |

Import sets in a project's `devenv.yaml`:

```yaml
inputs:
  devenvs:
    url: github:hatimthayyil/devenvs
    flake: false
imports:
  - devenvs/rust
  - devenvs/rust-gui
```

To try local changes to a set, override the input: `devenv -o devenvs path:/hatimthayyil/code/devenvs shell`.

## Templates

```sh
nix flake init -t github:hatimthayyil/devenvs#<template>
```

| Template | Contents |
|---|---|
| `dioxus` | Dioxus web app, `rust` set, wasm32 target |
| `js-npm` | JavaScript with npm |
| `python` | Python with uv |
| `sagemath` | SageMath with uv and marimo |

The `dioxus` template pins `wasm-bindgen` in `Cargo.toml` to the version bundled with nixpkgs' `dioxus-cli`. After `devenv update`, `dx build` names the version to pin.

## Checks

`devenv shell -- check` builds each set's shell in a scratch project.
