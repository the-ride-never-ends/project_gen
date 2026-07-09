param(
    [Parameter(Mandatory=$true)]
    [string]$ProjectName
)

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
Copy-Item -Path (Join-Path $ScriptDirectory "install.ps1") -Destination (Join-Path $TargetDirectory "install.ps1")