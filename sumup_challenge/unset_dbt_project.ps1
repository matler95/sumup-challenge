# unset_dbt_project.ps1

Remove-Item Env:\DBT_PROFILES_DIR -Force
Remove-Item Env:\DBT_USER -Force

if (Get-Command deactivate -ErrorAction SilentlyContinue) {
    deactivate
    Write-Host "   - Virtual environment DEACTIVATED."
}

Write-Host "✅ Project environment UNSET."
Write-Host "   - DBT_PROFILES_DIR removed."
Write-Host "   - DBT_USER removed."