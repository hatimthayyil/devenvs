# dev

Shared [devenv](https://devenv.sh) environments and project templates.

## Environments

| Environment | Provides |
|---|---|
| `envs/rust` | Rust toolchain, bacon, cargo-nextest, cargo-workspaces, watchexec |
| `envs/rust-gui` | Wayland, X11, Vulkan and OpenGL libraries on `LD_LIBRARY_PATH`, pkg-config |
| `envs/tauri` | cargo-tauri and the GTK and WebKitGTK build libraries |
| `envs/python-cuda` | Python with uv, NVIDIA driver libraries from `/run/opengl-driver` |

Import them in a project's `devenv.yaml`:

```yaml
inputs:
  dev:
    url: github:hatimthayyil/dev
    flake: false
imports:
  - dev/envs/rust
  - dev/envs/rust-gui
```

To try local changes, override the input: `devenv -o dev path:<checkout> shell`.

## Templates

```sh
nix flake init -t github:hatimthayyil/dev#<template>
```

| Template | Contents |
|---|---|
| `dioxus` | Dioxus web app, `envs/rust`, wasm32 target |
| `js-npm` | JavaScript with npm |
| `python` | Python with uv |
| `sagemath` | SageMath with uv and marimo |

The `dioxus` template pins `wasm-bindgen` in `Cargo.toml` to the version bundled with nixpkgs' `dioxus-cli`. After `devenv update`, `dx build` names the version to pin.

## Checks

`devenv shell -- check` builds each environment's shell in a scratch project.
