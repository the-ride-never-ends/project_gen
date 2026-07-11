<#
.SYNOPSIS
    Scaffolds a new project directory under C:\Users\kyle\repos.
.DESCRIPTION
    Creates a new project folder, copies .gitignore from the script's own
    directory into it, and creates blank __init__.py, main.py, and
    requirements.txt files.
.PARAMETER ProjectName
    Name of the project folder to create under C:\Users\kyle\repos.
.PARAMETER Help
    Displays this help message and exits.
.EXAMPLE
    .\project-gen.ps1 -ProjectName "my-new-project"
#>

param(
    [Parameter(Mandatory=$false)]
    [string]$ProjectName,

    [Parameter(Mandatory=$false)]
    [switch]$HasGui,

    [switch]$Help
)

if ($Help) {
    Get-Help $PSCommandPath -Full
    return
}

if (-not $ProjectName) {
    Write-Error "ProjectName is required. Use -Help for usage."
    return
}

$BasePath = "C:\Users\kyle\repos"
$TargetDirectory = Join-Path $BasePath $ProjectName
$ScriptDirectory = $PSScriptRoot

if (-not (Test-Path $TargetDirectory)) {
    New-Item -ItemType Directory -Path $TargetDirectory | Out-Null
}

Copy-Item -Path (Join-Path $ScriptDirectory ".gitignore") -Destination (Join-Path $TargetDirectory ".gitignore")
New-Item -ItemType File -Path (Join-Path $TargetDirectory "__init__.py")
New-Item -ItemType File -Path (Join-Path $TargetDirectory "main.py")
New-Item -ItemType File -Path (Join-Path $TargetDirectory "requirements.txt")
Copy-Item -Path (Join-Path $ScriptDirectory "_install.ps1") -Destination (Join-Path $TargetDirectory "install.ps1")

function Make-Subfolder {
    param(
        [string]$TargetDirectory,
        [string]$SubfolderName
    )
    {
        $SubfolderPath = Join-Path $TargetDirectory $SubfolderName
        if (-not (Test-Path $SubfolderPath)) {
            New-Item -ItemType Directory -Path $SubfolderPath | Out-Null
        }
    }
}


if ($HasGui) {
    New-Item -ItemType File -Path (Join-Path $TargetDirectory "gui.py")
    Make-Subfolder -TargetDirectory $TargetDirectory -SubfolderName "root"
    $GuiDirectory = Join-Path $TargetDirectory "root"
    Make-Subfolder -TargetDirectory $GuiDirectory -SubfolderName "static"
    Make-Subfolder -TargetDirectory $GuiDirectory -SubfolderName "templates"
    $StaticDirectory = Join-Path $GuiDirectory "static"
    $TemplatesDirectory = Join-Path $GuiDirectory "templates"
    New-Item -ItemType File -Path (Join-Path $StaticDirectory "index.html")
    New-Item -ItemType File -Path (Join-Path $TemplatesDirectory "index.html")
    Make-Subfolder -TargetDirectory $TargetDirectory -SubfolderName "global"
    $GlobalDirectory = Join-Path $TargetDirectory "global"
    Make-Subfolder -TargetDirectory $GlobalDirectory -SubfolderName "css"
    Make-Subfolder -TargetDirectory $GlobalDirectory -SubfolderName "js"
    Make-Subfolder -TargetDirectory $GlobalDirectory -SubfolderName "images"
    Make-Subfolder -TargetDirectory $TargetDirectory -SubfolderName "resources"
    $ResourcesDirectory = Join-Path $TargetDirectory "resources"
    Make-Subfolder -TargetDirectory $ResourcesDirectory -SubfolderName "images"
}
