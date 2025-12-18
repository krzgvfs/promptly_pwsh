function Write-Menu {
    [CmdletBinding()]
    param(
        [object[]]$Items,
        [int]$Selected,
        [int]$PreviousSelected,
        [string]$Title,
        [string]$AsciiArt,
        [MenuTheme]$Theme
    )

    if (-not $Theme) {
        $Theme = New-MenuTheme
    }

    $cursorOffset = 0
    if (-not [string]::IsNullOrEmpty($AsciiArt)) {
        $cursorOffset = ($AsciiArt -split "`n").Length
    }

    $maxNumberWidth = ($Items.Length.ToString().Length) + 2

    if ($PreviousSelected -eq -1) {
        Clear-Host

        if ($cursorOffset -gt 0) {
            [System.Console]::ForegroundColor = $Theme.AsciiArtColor
            [System.Console]::WriteLine($AsciiArt)
            [System.Console]::ResetColor()
        }

        [System.Console]::ForegroundColor = $Theme.TitleColor
        [System.Console]::WriteLine($Title)
        [System.Console]::WriteLine()
        [System.Console]::ResetColor()

        for ($i = 0; $i -lt $Items.Length; $i++) {
            $item = $Items[$i]
            $itemNumberString = "$($i + 1). ".PadRight($maxNumberWidth)
            $displayLabel = "$itemNumberString$($item.Label)"
            $displayIcon = if (-not [string]::IsNullOrEmpty($item.Icon)) { "$($item.Icon) " } else { "" }

            $textColor = if ($item.ForegroundColor -ne 'White') { $item.ForegroundColor } else { $Theme.MenuTextColor }

            [System.Console]::ForegroundColor = $textColor
            if ($i -eq $Selected) {
                [System.Console]::BackgroundColor = $Theme.SelectionBackgroundColor
                [System.Console]::WriteLine(" > $displayIcon$displayLabel")
            } else {
                [System.Console]::BackgroundColor = $Theme.MenuBackgroundColor
                [System.Console]::WriteLine("   $displayIcon$displayLabel")
            }
            [System.Console]::ResetColor()
        }
        return
    }

    $totalOffset = $cursorOffset + 2
    $windowWidth = [System.Console]::WindowWidth

    $previousItem = $Items[$PreviousSelected]
    $previousItemNumberString = "$($PreviousSelected + 1). ".PadRight($maxNumberWidth)
    $previousDisplayLabel = "$previousItemNumberString$($previousItem.Label)"
    $previousDisplayIcon = if (-not [string]::IsNullOrEmpty($previousItem.Icon)) { "$($previousItem.Icon) " } else { "" }
    $previousLine = "   $previousDisplayIcon$previousDisplayLabel"

    $previousTextColor = if ($previousItem.ForegroundColor -ne 'White') { $previousItem.ForegroundColor } else { $Theme.MenuTextColor }

    [System.Console]::SetCursorPosition(0, $PreviousSelected + $totalOffset)
    [System.Console]::Write(" " * $windowWidth)
    [System.Console]::SetCursorPosition(0, $PreviousSelected + $totalOffset)

    [System.Console]::ForegroundColor = $previousTextColor
    [System.Console]::BackgroundColor = $Theme.MenuBackgroundColor
    [System.Console]::Write($previousLine)
    [System.Console]::ResetColor()

    $selectedItem = $Items[$Selected]
    $selectedItemNumberString = "$($Selected + 1). ".PadRight($maxNumberWidth)
    $selectedDisplayLabel = "$selectedItemNumberString$($selectedItem.Label)"
    $selectedDisplayIcon = if (-not [string]::IsNullOrEmpty($selectedItem.Icon)) { "$($selectedItem.Icon) " } else { "" }
    $selectedLine = " > $selectedDisplayIcon$selectedDisplayLabel"

    $selectedTextColor = if ($selectedItem.ForegroundColor -ne 'White') { $selectedItem.ForegroundColor } else { $Theme.MenuTextColor }

    [System.Console]::SetCursorPosition(0, $Selected + $totalOffset)
    [System.Console]::Write(" " * $windowWidth)
    [System.Console]::SetCursorPosition(0, $Selected + $totalOffset)

    [System.Console]::ForegroundColor = $selectedTextColor
    [System.Console]::BackgroundColor = $Theme.SelectionBackgroundColor
    [System.Console]::Write($selectedLine)
    [System.Console]::ResetColor()
}
