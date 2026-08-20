# Project Generator

A PowerShell script that scaffolds a new Python project directory under `C:\Users\kyle\repos`.

## What it does

When you run the script, it creates a new project folder and adds the following files:

- `.gitignore`
- `__init__.py`
- `main.py`
- `requirements.txt`

The script copies `.gitignore` from its own directory into the new project folder.

## Usage

```powershell
.\project-gen.ps1 -ProjectName "my-new-project"
```

## Parameters

### `-ProjectName`

Name of the project folder to create under `C:\Users\kyle\repos`.

### `-Help`

Displays the help message and exits.

## Example

```powershell
.\project-gen.ps1 -ProjectName "my-new-project"
```

This creates a folder named `my-new-project` inside `C:\Users\kyle\repos` with the starter project files.
