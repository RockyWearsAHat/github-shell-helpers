# Git Shell Helpers

Small quality-of-life helpers wrapped as git subcommands:

- `git upload` – stage, commit, and push, with optional AI-generated commit messages using GitHub Copilot CLI.
- `git get` – initialize a local repo from a remote (like a lightweight `git clone` flow).
- `git initialize` – initialize the current directory as a repo, create an initial commit, set `origin`, and push.

## Installation options

### 1. One-line script installer (recommended for most users)

This installs the helpers into `~/bin` and their man pages into `~/man/man1`, and wires `PATH` and `MANPATH` in your `~/.zshrc`.

```sh
curl -fsSL \
  https://raw.githubusercontent.com/RockyWearsAHat/github-shell-helpers/main/Git-Shell-Helpers-Installer.sh \
  | zsh
```

After installation, either open a new terminal or run:

```sh
source ~/.zshrc
```

Then you can use:

- `git upload`
- `git get`
- `git initialize`
- `git help upload|get|initialize`

### 2. macOS .pkg installer

For a more "native" macOS experience, there is also a signed-style `.pkg` built by CI:

- The pkg installs binaries into `/usr/local/bin` and man pages into `/usr/local/share/man/man1`.
- It is built by GitHub Actions from the latest `main` branch and uploaded as an artifact named `github-shell-helpers-pkg`.

Usage:

1. Go to the **Actions** tab for this repo and open the latest successful run of the **Build installer** workflow.
2. Download the `github-shell-helpers-pkg` artifact (`github-shell-helpers-<version>.pkg`).
3. Double-click the `.pkg` and follow the standard macOS Installer flow.

After installation, the commands and man pages should be available immediately in any new shell, without editing your `PATH`.

## Why two installer methods?

- **Script installer (`Git-Shell-Helpers-Installer.sh`)**
  - Cross-shell friendly, very easy to share as a copy-pastable command.
  - Installs into your home directory and updates your shell config.
- **macOS `.pkg` installer**
  - Integrates with the native macOS Installer UI.
  - Installs into system-level locations (`/usr/local/...`) without touching your `~/.zshrc`.

Both install the same commands and man pages; they just target different installation styles.

## Development

- Update the version number in `VERSION` before cutting a new release.
- Build artifacts locally:
  - Script installer dist: `./scripts/build-dist.sh` → `dist/Git-Shell-Helpers-Installer.sh`
  - macOS pkg: `./scripts/build-pkg.sh` → `dist/github-shell-helpers-<version>.pkg`
- VS Code tasks:
  - **Build installer** – runs `./scripts/build-dist.sh`.
  - **Build macOS pkg** – runs `./scripts/build-pkg.sh`.

CI (see `.github/workflows/build-installer.yml`) ensures both installers build cleanly on each push to `main`.
