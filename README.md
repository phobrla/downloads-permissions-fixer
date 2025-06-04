# downloads-permissions-fixer

A simple script to ensure your Downloads folders on macOS exist, are real directories (not symlinks or files), and have the correct user permissions. This script fixes both your local Downloads folder and your iCloud Downloads folder.

## What it does

- Ensures `/Users/phobrla/Downloads` is a real directory (not a symlink or file).
- Ensures `/Users/phobrla/Library/Mobile Documents/com~apple~CloudDocs/Downloads` exists as a directory.
- Recursively applies user read/write/execute permissions to both folders.

## Usage

```bash
chmod +x ensure_and_fix_downloads.sh
./ensure_and_fix_downloads.sh
