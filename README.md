# Project Generator

A PowerShell script that scaffolds a new Python project directory under `C:\Users\kyle\repos`.

## What it does

When you run the script, it creates a new project folder and adds the following files:

- `.gitignore`
- `__init__.py`
- `main.py`
- `requirements.txt`

The script copies `.gitignore` from its own directory into the new project folder.

### `-HasGui`

Adds a `gui.py` file plus a scaffold for a web GUI:

- `root/static/index.html`
- `root/templates/index.html`
- `global/css`, `global/js`, `global/images`
- `resources/images`

### `-HasTests`

Adds a `tests` directory with a pytest skeleton:

- `tests/__init__.py`
- `tests/conftest.py`
- `tests/test_main.py` (placeholder test)

## Usage

```powershell
.\project-gen.ps1 -ProjectName "my-new-project"
```

## Parameters

### `-ProjectName`

Name of the project folder to create under `C:\Users\kyle\repos`.

### `-HasGui`

Switch. When present, scaffolds the GUI folders and files described above.

### `-HasTests`

Switch. When present, scaffolds the `tests` directory described above.

### `-Help`

Displays the help message and exits.

## Example

```powershell
.\project-gen.ps1 -ProjectName "my-new-project"
```

This creates a folder named `my-new-project` inside `C:\Users\kyle\repos` with the starter project files.
