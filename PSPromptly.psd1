@{
    RootModule        = 'PSPromptly.psm1'
    ModuleVersion     = '0.1.3'
    GUID              = '8064a379-f3ee-4f8f-8f3f-831faae663df'
    Author            = 'Marcos Santos'
    CompanyName       = 'Marcos Santos'
    Description       = 'PowerShell module for creating beautiful interactive command-line menus with keyboard navigation, custom themes, and ASCII art support'
    FunctionsToExport = @('Show-Menu', 'Select-Option', 'New-MenuItem', 'New-ExitMenuItem', 'New-MenuTheme')
    RequiredModules   = @()
    FileList          = @(
        'PSPromptly.psm1',
        'src/Core/Menu.ps1',
        'src/Core/MenuItem.ps1',
        'src/Core/New-MenuItem.ps1',
        'src/UI/Input.ps1',
        'src/UI/Render.ps1',
        'src/UI/Style.ps1'
    )
    PrivateData       = @{
        PSData = @{
            ProjectUri   = 'https://github.com/krzgvfs/promptly_pwsh'
            Tags         = @('Menu', 'CLI', 'UI', 'Console', 'Navigation', 'Prompt', 'Interactive', 'TUI')
            ReleaseNotes = @'
Version 0.1.3:
- Feat: Implements theme support
- Added New-MenuItem factory functions for easier menu item creation
- Comprehensive README update with API reference, examples, and documentation
- Improved project structure and code organization
- Fixed module loading order to prevent class definition issues
- Added support for custom icons and colors per menu item
'@
        }
    }
}
