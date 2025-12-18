Import-Module -Name "./PSPromptly.psd1" -Force

$action1 = { Test-Connection google.com }
$action2 = { Get-ChildItem Env: }
$action3 = { Get-Process -Id $pid }

$menuItems = @(
    New-MenuItem -Label "Testar google.com" -Action $action1
    New-MenuItem -Label "Variáveis de ambiente" -Action $action2
    New-MenuItem -Label "Processo do PowerShell" -Action $action3
    New-ExitMenuItem -ForegroundColor Red 
)

$asciiArt = @"
• ▌ ▄ ·.  ▄▄▄· ▄▄▄   ▄▄·       .▄▄ ·     .▄▄ ·  ▄▄▄·  ▐ ▄ ▄▄▄▄▄      .▄▄ · 
·██ ▐███▪▐█ ▀█ ▀▄ █·▐█ ▌▪▪     ▐█ ▀.     ▐█ ▀. ▐█ ▀█ •█▌▐█•██  ▪     ▐█ ▀. 
▐█ ▌▐▌▐█·▄█▀▀█ ▐▀▀▄ ██ ▄▄ ▄█▀▄ ▄▀▀▀█▄    ▄▀▀▀█▄▄█▀▀█ ▐█▐▐▌ ▐█.▪ ▄█▀▄ ▄▀▀▀█▄
██ ██▌▐█▌▐█ ▪▐▌▐█•█▌▐███▌▐█▌.▐▌▐█▄▪▐█    ▐█▄▪▐█▐█ ▪▐▌██▐█▌ ▐█▌·▐█▌.▐▌▐█▄▪▐█
▀▀  █▪▀▀▀ ▀  ▀ .▀  ▀·▀▀▀  ▀█▄▀▪ ▀▀▀▀      ▀▀▀▀  ▀  ▀ ▀▀ █▪ ▀▀▀  ▀█▄▀▪ ▀▀▀▀ 
"@

$theme = New-MenuTheme `
    -AsciiArtColor Magenta `
    -TitleColor White `
    -MenuTextColor Gray `
    -MenuBackgroundColor Black `
    -SelectionBackgroundColor Yellow

Show-Menu -Items $menuItems -Title "/ Início" -AsciiArt $asciiArt -Theme $theme