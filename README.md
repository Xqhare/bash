# Project Overview

A collection of personal utility bash scripts for system maintenance, automation, project management, and homelab orchestration.

## Key Commands
- **Create a new Rust project:**
  ```bash
  bash scripts_by_me/create_rust_project.sh
  ```
- **Perform system updates:**
  ```bash
  bash scripts_by_me/update.sh
  ```
- **Launcher for updates in terminal window:**
  ```bash
  bash scripts_by_me/update-program.sh
  ```

# Directory Structure

- **[homelab/](file:///home/xqhare/Adytum/Programming/bash/homelab)**: Scripts for managing homelab container stacks (database, Gitea, registry, etc.).
- **[scripts_by_me/](file:///home/xqhare/Adytum/Programming/bash/scripts_by_me)**: Personal utility scripts.
  - `create_rust_project.sh`: Prompt and selector CLI to create Rust binaries/libraries.
  - `init_gitea_repo.sh`: Connects to Gitea templates, clones, and starts local environment setup.
  - `update.sh`: Performs system updates via `flatpak`, `apt`, and `snap`.
  - `update-program.sh`: Run the updater in a separate gnome-terminal session.
  - `randomizer.sh` / `randomizerTester.sh`: Runner and test wrappers for Python applications.
  - `toucheggDebuger.sh`: Touchpad gesture troubleshooting utility.
  - `VirtualCableSetup.sh`: Audio device configuration for virtual cables.
  - `5txtFiles.sh`: Create 5 text files.
  - `crash.sh`: Diagnostic crash journal reader.
  - `date.sh`: Wrapper for Python date scripts.

# Building and Running

These are standalone bash scripts and do not require a build step.

### Running a Script
You can run any script directly using `bash`:
```bash
bash scripts_by_me/update.sh
```

Or by making them executable:
```bash
chmod +x scripts_by_me/update.sh
./scripts_by_me/update.sh
```

# Development Conventions

- **Interpreter:** Use `#!/usr/bin/env bash` as the shebang.
- **Sudo:** Some maintenance scripts require `sudo` privileges.
- **Exit:** Always use `exit 0` at the end of successful script execution.
