@{
    RootModule        = 'PSPromptlyNav.psm1'
    ModuleVersion     = '0.1.0'
    GUID              = '8064a379-f3ee-4f8f-8f3f-831faae663df'
    Author            = 'Marcos Santos'
    CompanyName       = 'Marcos Santos'
    Description       = 'Biblioteca de criação de menus de navegação para aplicações de linha de comando.'
    FunctionsToExport = @('Show-Menu', 'Select-Option')
    RequiredModules   = @()
    ScriptsToProcess  = @('src/Core/MenuItem.ps1')
    FileList          = @('PSPromptlyNav.psm1', 'src/Core/Menu.ps1', 'src/UI/Render.ps1')
}
