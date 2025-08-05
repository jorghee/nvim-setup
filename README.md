# <samp>Neovim Configuración con Lazy.nvim</samp>

Esta configuración ha migrado de **Packer.nvim** a **Lazy.nvim** como 
gestor de plugins. Vamos a detallar la estructura anterior y nueva, los 
prerrequisitos, y las instrucciones paso a paso para instalar y 
ejecutar Neovim sin errores.

## 1. Contexto de la Migración

Anteriormente, esta configuración utilizaba el gestor de plugins 
[Packer.nvim](https://github.com/wbthomason/packer.nvim). La 
estructura fue hecha siguiendo un video de **Charlie L** en su canal 
de YouTube:

[![Watch the video](https://img.youtube.com/vi/Y2iqRZ4EYbk/0.jpg)](https://www.youtube.com/watch?v=Y2iqRZ4EYbk)

### Estructura anterior (basada en Packer)

```zsh
.
├── after
│   └── plugin
│       ├── colors.lua
│       ├── hardline.lua
│       ├── lsp.lua
│       ├── telescope.lua
│       └── treesitter.lua
├── init.lua
├── lua
│   └── jorgeisbot
│       ├── init.lua
│       ├── packer.lua
│       ├── remap.lua
│       └── settings.lua
└── plugin
    └── packer_compiled.lua
```

La nueva versión reemplaza esta estructura con un enfoque modular y 
mantenido por el ecosistema de 
[Lazy.nvim](https://lazy.folke.io/installation)

## 2. Instalación y Prerrequisitos

En esta sección vamos a cubrir cómo evitar errores comunes como los 
relacionados con `tree-sitter`, `node`, o `ripgrep`.

### Requisitos del sistema

Asegúrate de tener las siguientes herramientas instaladas:

| Requisito       | Versión mínima | Instalación en Arch Linux           |
| --------------- | -------------- | ----------------------------------- |
| Neovim          | `v0.9.0`       | `sudo pacman -S neovim`             |
| Git             | Cualquiera     | `sudo pacman -S git`                |
| GCC / Clang     | Cualquiera     | `sudo pacman -S base-devel`         |
| ripgrep         | Cualquiera     | `sudo pacman -S ripgrep`            |
| fd              | Cualquiera     | `sudo pacman -S fd`                 |
| Node.js + npm   | Recomendado    | `volta install node` (ver abajo)    |
| pnpm            | Recomendado    | `npm install -g pnpm`               |
| tree-sitter CLI | Requerido      | `cargo install tree-sitter-cli`     |
| Rust (cargo)    | Requerido      | `sudo pacman -S rust`               |

> **Nota**: Se recomienda usar [Volta](https://volta.sh) para gestionar 
`node`, `npm`, `pnpm`, etc.

#### Instalar Volta + Node.js

```zsh
# Volta install
curl https://get.volta.sh | bash
source ~/.zshrc  # o ~/.bashrc

# Install Node.js
volta install node
volta install pnpm
```

#### Instalar tree-sitter CLI

```zsh
cargo install tree-sitter-cli
```

---

## 3. Estructura de Archivos con Lazy.nvim

La nueva estructura es modular, clara y está basada en las 
recomendaciones oficiales de [Lazy.nvim](https://lazyvim.org/).

### Estructura de directorios con Lazy.nvim

```zsh
.
├── init.lua
├── lazy-lock.json
└── lua
    ├── config
    │   ├── keymaps.lua       # Atajos de teclado
    │   ├── lazy.lua          # Configuración de Lazy.nvim
    │   └── options.lua       # Opciones globales de Neovim
    └── plugins
        ├── colorscheme.lua   # Tema y apariencia
        ├── completion.lua    # Autocompletado y LSP
        ├── core.lua          # Plugins esenciales
        ├── telescope.lua     # Fuzzy Finder
        └── ui.lua            # Mejoras visuales (barra de estado, etc.)
```

---

## References and resources

* Lazy.nvim Docs: [https://lazyvim.org/](https://lazyvim.org/)
* Tree-sitter: [https://tree-sitter.github.io/](https://tree-sitter.github.io/)
* ripgrep: [https://github.com/BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
* fd: [https://github.com/sharkdp/fd](https://github.com/sharkdp/fd)
* Volta: [https://volta.sh](https://volta.sh)
* Rust (cargo): [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install)

