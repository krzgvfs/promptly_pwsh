function Show-Menu {
    [CmdletBinding()]
    param(
        [MenuItem[]]$Items,
        [string]$Title
    )

    $itemLabels = $Items.Label
    $selectedLabel = Select-Option -Items $itemLabels -Title $Title

    $selectedItem = $Items.Where({ $_.Label -eq $selectedLabel }, 'First')
    $selectedItem.Invoke()
}

function Select-Option {
    [CmdletBinding()]
    param (
        [string[]]$Items,
        [string]$Title
    )

    $selected = 0
    while ($true) {
        Render-Menu -Items $Items -Selected $selected -Title $Title
        $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown").VirtualKeyCode

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
        }
    }
}