function Render-Menu {
    [CmdletBinding()]
    param(
        [string[]]$Items,
        [int]$Selected,
        [string]$Title
    )

    Clear-Host
    Write-Host "$Title`n"

    for ($i = 0; $i -lt $Items.Length; $i++) {
        if ($i -eq $Selected) {
            Write-Host -ForegroundColor Black -BackgroundColor Green " > $($Items[$i])"
        } else {
            Write-Host "   $($Items[$i])"
        }
    }
}
