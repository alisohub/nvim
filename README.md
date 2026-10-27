# Aliso Neovim Configuration

A modern, fast, and robust Neovim configuration built with `lazy.nvim`, `nvim-treesitter`, `telescope.nvim`, `conform.nvim`, and native LSP support.

---

## Prerequisites (All Platforms)

Make sure you have the following installed on your system before launching Neovim:
1. **Neovim** (v0.10.x or the latest nightly/v0.11+ recommended).
2. **Git** (for cloning plugins).
3. **A Nerd Font** (e.g., JetBrainsMono Nerd Font) installed and configured in your terminal for proper icon rendering.

---

## Platform-Specific Setup

### 1. PC (Linux / macOS / Windows)

On standard PC environments, plugin toolchains and compilers are handled seamlessly via `mason.nvim` and system package managers.

#### Additional Requirements
* **C Compiler** (`gcc`, `clang`, or `zig`) for compiling Tree-sitter parsers.
* **Node.js** (required for certain LSP servers like `pyright`).
* **`tree-sitter-cli`** (recommended for `nvim-treesitter` on the `main` branch):
  ```bash
  npm install -g tree-sitter-cli
  # OR via cargo:
  cargo install tree-sitter-cli --locked
  ```

#### Quick Start
Clone this configuration into your Neovim config directory:
```bash
git clone <your-repo-url> ~/.config/nvim
nvim
```
Open Neovim and run `:Lazy sync`, then `:TSUpdate`.

---

### 2. Termux (Android / ARM64)

Because Android uses Bionic `libc` instead of GNU/Linux `glibc`, prebuilt binaries (such as those downloaded by `mason.nvim` for `lua_ls` or `pyright`) **will not run**. You must install your tools natively through Termux packages.

#### Step 1: Install System Dependencies & CLI
Update your Termux packages and install compilers, git, and the tree-sitter CLI:
```bash
pkg update && pkg upgrade -y
pkg install tree-sitter-cli clang make git rust binutils
```
*(Note: If `tree-sitter-cli` isn't in your Termux repository mirror, compile it via Rust Cargo and link it:)*
```bash
cargo install tree-sitter-cli --no-default-features --locked
ln -sf ~/.cargo/bin/tree-sitter $PREFIX/bin/tree-sitter
```

#### Step 2: Install Native LSP Servers and Formatters
Install your language servers and formatters directly via `pkg` or `npm`:
```bash
# Lua language server & formatter
pkg install lua-language-server stylua python-black

# Pyright (Python LSP) requires Node.js
pkg install nodejs
npm install -g pyright
```

#### Step 3: Launch Neovim
Clone the configuration into `~/.config/nvim`, clear any stale cache, and launch:
```bash
git clone <your-repo-url> ~/.config/nvim
rm -rf ~/.local/share/nvim/lazy/nvim-treesitter
nvim
```
Inside Neovim, run:
1. `:Lazy sync`
2. `:TSUpdate`

---

## Keybindings & Features

* **Leader Key:** `<Space>`
* **File Explorer:** `<leader>e` (`netrw`)
* **Telescope Find Files:** `<leader>ff`
* **Git Files:** `<C-p>`
* **Grep String:** `<leader>gs`
* **Formatting:** `<leader>lf` (via `conform.nvim`)
* **Diagnostics Toggle:** `<leader>xq` (via `trouble.nvim`)
* **Harpoon Menu:** `<C-e>` / Add File: `<leader>a`