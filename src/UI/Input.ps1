function Get-KeyInput {
    [CmdletBinding()]
    param()
    
    return $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown").VirtualKeyCode
}