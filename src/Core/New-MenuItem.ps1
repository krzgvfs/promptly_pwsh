function New-MenuItem {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Label,

        [Parameter(Mandatory)]
        [scriptblock]$Action,

        [ConsoleColor]$ForegroundColor = 'White',
        [ConsoleColor]$BackgroundColor = 'Black',
        [string]$Icon = ''
    )

    return [MenuItem]::new($Label, $Action, $ForegroundColor, $BackgroundColor, $Icon, $false)
}

function New-ExitMenuItem {
    [CmdletBinding()]
    param(
        [string]$Label = 'Exit',
        [ConsoleColor]$ForegroundColor = 'Red',
        [string]$Icon = ''
    )

    return [MenuItem]::new(
        $Label,
        { return },
        $ForegroundColor,
        'Black',
        $Icon,
        $true
    )
}