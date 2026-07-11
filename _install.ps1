# Basic Python pip installation script

# Check if Python 13 is installed
try {
    $pythonVersion = python3.13 --version 2>&1
    Write-Host "Found Python: $pythonVersion"
} catch {
    Write-Host "Python 3.13 is not installed or not in PATH"
    exit 1
}

# Create virtual environment
Write-Host "Creating virtual environment..."
python3.13 -m venv venv
.\venv\Scripts\Activate.ps1

# Upgrade pip
Write-Host "Upgrading pip..."
python -m pip install --upgrade pip

# Install dependencies from requirements.txt if it exists
if (Test-Path "requirements.txt") {
    Write-Host "Installing dependencies from requirements.txt..."
    python -m pip install -r requirements.txt
} else {
    Write-Host "requirements.txt not found. Skipping dependency installation."
}

Write-Host "Installation complete!"
