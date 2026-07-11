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