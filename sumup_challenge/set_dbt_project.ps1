$env:DBT_PROFILES_DIR="$PSScriptRoot\.dbt"

. "$PSScriptRoot\..\.venv\Scripts\Activate.ps1"

$dbtUser = Read-Host -Prompt "Enter your unique identifier (for DBT_USER)"
$env:DBT_USER=$dbtUser

Write-Host "✅ Project environment READY!"
Write-Host "   - DBT_PROFILES_DIR set to: $($env:DBT_PROFILES_DIR)"
Write-Host "   - DBT_USER set to: $($env:DBT_USER)"
Write-Host "   - Virtual environment activated."