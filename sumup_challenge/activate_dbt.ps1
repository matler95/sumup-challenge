# Save current DBT_PROFILES_DIR if it exists
$global:OldProfilesDir = $env:DBT_PROFILES_DIR

# Point dbt to the .dbt folder
$env:DBT_PROFILES_DIR = "$PSScriptRoot\.dbt"

# Path to venv activate
$venvPath = "$PSScriptRoot\..\ .venv\Scripts\Activate.ps1" -replace ' ', ''

if (Test-Path $venvPath) {
    & $venvPath
    Write-Host "Virtual environment activated from $venvPath"
} else {
    Write-Host "Could not find venv at $venvPath"
}

Write-Host "DBT_PROFILES_DIR set to $env:DBT_PROFILES_DIR"
Write-Host "You can now run dbt commands using .dbt/profiles.yml"
Write-Host "When finished, run: .\deactivate_dbt.ps1"
