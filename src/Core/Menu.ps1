function Show-Menu {
    [CmdletBinding()]
    param(
        [MenuItem[]]$Items,
        [string]$Title
    )

    $itemLabels = $Items.Label
    $selectedLabel = Select-Option -Items $itemLabels -Title $Title

    if ($selectedLabel) {
        $selectedItem = $Items.Where({ $_.Label -eq $selectedLabel }, 'First')
        $selectedItem.Invoke()
    }
}

function Select-Option {
    [CmdletBinding()]
    param (
        [string[]]$Items,
        [string]$Title
    )

    if (-not $Items) {
        Write-Warning "Select-Option was called with no items."
        return $null
    }

    $selected = 0
    while ($true) {
        Render-Menu -Items $Items -Selected $selected -Title $Title
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
                return $Items[$selected]
            }
            39 {
                return $Items[$selected]
            }
            27 {
                return $null
            }
        }
    }
}