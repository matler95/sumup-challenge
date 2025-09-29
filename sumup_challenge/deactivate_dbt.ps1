# Restore DBT_PROFILES_DIR
if ($null -ne $global:OldProfilesDir) {
    $env:DBT_PROFILES_DIR = $global:OldProfilesDir
    Write-Host "DBT_PROFILES_DIR restored to $env:DBT_PROFILES_DIR"
} else {
    Remove-Item Env:\DBT_PROFILES_DIR -ErrorAction SilentlyContinue
    Write-Host "DBT_PROFILES_DIR unset"
}

# Deactivate venv
if (Get-Command deactivate -ErrorAction SilentlyContinue) {
    deactivate
    Write-Host "Virtual environment deactivated"
} else {
    Write-Host "Virtual environment not active"
}
