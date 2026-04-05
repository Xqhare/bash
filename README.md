# Project Overview

A collection of personal utility bash scripts for system maintenance, automation, and project management. 

## Key Commands
- `update.sh`: Run this to update all system packages (`apt`, `flatpak`, `snap`).
- `update-program.sh`: Runs the above in a new gnome terminal session

# Directory Structure

- `scripts_by_me/`: Main directory for personal scripts.
  - `Selfmade/`: Scripts created by the user for various automation tasks.
    - `update.sh`: Performs system-wide updates using `flatpak`, `apt`, and `snap`.
    - `update-program.sh`: Runs `update.sh` in a new `gnome-terminal` window.
    - `randomizer.sh`: Navigates to my `RandomizerProject` Python project and runs it.
    - `randomizerTester.sh`: A script for testing the randomizer logic.
    - `toucheggDebuger.sh`: Checks logs for the `touchegg` service.
    - `VirtualCableSetup.sh`: For setting up virtual audio cables.
    - `5txtFiles.sh`: Create 5 files.
    - `crash.sh`: Print system crash log.
    - `date.sh`: Runs a Python date script.
  - `Pasta/`: Placeholder for copied or external scripts (currently empty).

# Building and Running

These are standalone bash scripts and do not require a build step.

### Running a script
You can run any script directly using `bash`:
```bash
bash scripts_by_me/Selfmade/update.sh
```

Or by making them executable:
```bash
chmod +x scripts_by_me/Selfmade/update.sh
./scripts_by_me/Selfmade/update.sh
```

# Development Conventions

- **Interpreter:** Use `#!/usr/bin/env bash` as the shebang.
- **Sudo:** Some maintenance scripts require `sudo` privileges.
- **Exit:** Always use `Exit 0` at the end of scripts.
