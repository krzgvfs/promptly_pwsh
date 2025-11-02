Import-Module -Name "PSPromptly" -Force

$action1 = { Write-Host "Action 1" }
$action2 = { Write-Host "Action 2" }
$action3 = { Write-Host "Action 3" }
$action4 = { Write-Host "Action 4" }
$action5 = { Write-Host "Action 5" }

$menuItems = @(
    [MenuItem]::new("Item 01", $action1)
    [MenuItem]::new("Item 02", $action2)
    [MenuItem]::new("Item 03", $action3)
    [MenuItem]::new("Item 04", $action4)
    [MenuItem]::new("Item 05", $action5)
    [MenuItem]::new("Sair", { return } )
)

Show-Menu -Items $menuItems -Title "Menu principal"
