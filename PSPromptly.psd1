@{
    RootModule        = 'PSPromptly.psm1'
    ModuleVersion     = '0.1.2'
    GUID              = '8064a379-f3ee-4f8f-8f3f-831faae663df'
    Author            = 'Marcos Santos'
    CompanyName       = 'Marcos Santos'
    Description       = 'Library for creating navigation menus for command-line applications'
    FunctionsToExport = @('Show-Menu', 'Select-Option', 'New-MenuItem', 'New-ExitMenuItem', 'New-MenuTheme')
    RequiredModules   = @()
    FileList          = @('PSPromptly.psm1', 'src/Core/Menu.ps1', 'src/UI/Render.ps1', 'src/Core/MenuItem.ps1')
    PrivateData       = @{
        PSData = @{
            ProjectUri   = 'https://github.com/krzgvfs/promptly_pwsh'
            Tags         = @('Menu', 'CLI', 'UI', 'Console', 'Navigation', 'Prompt')
            ReleaseNotes = 'Initial version of the module. Includes the Show-Menu and Select-Option functions for creating basic interactive menus.'
        }
    }
}
