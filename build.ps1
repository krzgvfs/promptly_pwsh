Write-Host "Building Promptly..." -ForegroundColor Green

# Destination path for the module
$modulePath = Join-Path -Path ($env:PSModulePath -split ':')[0] -ChildPath 'PSPromptly'

# Create the directory if it doesn't exist
if (-not (Test-Path -Path $modulePath)) {
    New-Item -ItemType Directory -Path $modulePath -Force
}

# Copy module files
Copy-Item -Path "$PSScriptRoot/PSPromptly.psd1" -Destination $modulePath -Force
Copy-Item -Path "$PSScriptRoot/PSPromptly.psm1" -Destination $modulePath -Force
Copy-Item -Path "$PSScriptRoot/src" -Destination $modulePath -Recurse -Force
Copy-Item -Path "$PSScriptRoot/docs" -Destination $modulePath -Recurse -Force
Copy-Item -Path "$PSScriptRoot/examples" -Destination $modulePath -Recurse -Force


Import-Module "$PSScriptRoot/PSPromptly.psm1" -Force -Verbose
Invoke-Pester "$PSScriptRoot/tests" -Output Detailed

Write-Host "PSPromptly module copied to $modulePath" -ForegroundColor Green
