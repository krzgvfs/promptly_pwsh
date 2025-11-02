Write-Host "Building PSPromptlyNav..." -ForegroundColor Green
Import-Module "$PSScriptRoot/PSPromptlyNav.psm1" -Force -Verbose
Invoke-Pester "$PSScriptRoot/tests" -Output Detailed