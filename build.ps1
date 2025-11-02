Write-Host "Building Promptly..." -ForegroundColor Green
Import-Module "$PSScriptRoot/PSPromptly.psm1" -Force -Verbose
Invoke-Pester "$PSScriptRoot/tests" -Output Detailed