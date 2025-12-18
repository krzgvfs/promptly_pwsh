function Show-Menu {
    [CmdletBinding()]
    param(
        [object[]]$Items,
        [string]$Title,
        [string]$AsciiArt,
        [MenuTheme]$Theme
    )

    if (-not $Theme) {
        $Theme = New-MenuTheme
    }

    foreach ($item in $Items) {
        if ($item.GetType().Name -ne 'MenuItem') {
            throw "Invalid item passed to Show-Menu. Please create items using the New-MenuItem function."
        }
    }

    while ($true) {
        $selectedLabel = Select-Option -Items $Items -Title $Title -AsciiArt $AsciiArt -Theme $Theme

        if (-not $selectedLabel) {
            Clear-Host
            break
        }

        $selectedItem = $Items.Where({ $_.Label -eq $selectedLabel }, 'First')

        if ($selectedItem.IsExitItem) {
            Clear-Host
            break
        }

        Clear-Host
        $selectedItem.Invoke()

        Write-Host "`nPress Enter to continue..."
        Read-Host | Out-Null
    }
}

function Select-Option {
    [CmdletBinding()]
    param (
        [object[]]$Items,
        [string]$Title,
        [string]$AsciiArt,
        [MenuTheme]$Theme
    )

    if (-not $Items) {
        Write-Warning "Select-Option was called with no items."
        return $null
    }

    if (-not $Theme) {
        $Theme = New-MenuTheme
    }

    $selected = 0
    $previousSelected = -1

    try {
        [System.Console]::CursorVisible = $false
        while ($true) {
            Write-Menu -Items $Items -Selected $selected -PreviousSelected $previousSelected -Title $Title -AsciiArt $AsciiArt -Theme $Theme
            $previousSelected = $selected
            $key = Get-KeyInput

            switch ($key) {
                38 {
                    if ($selected -gt 0) {
                        $selected--
                    }
                }
                40 {
                    if ($selected -lt $Items.Length - 1) {
                        $selected++
                    }
                }
                13 {
                    return $Items[$selected].Label
                }
                39 {
                    return $Items[$selected].Label
                }
                27 {
                    return $null
                }
            }
        }
    }
    finally {
        [System.Console]::CursorVisible = $true
    }
}