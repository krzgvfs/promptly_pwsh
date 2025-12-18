class MenuItem {
    [string]$Label
    [scriptblock]$Action
    [ConsoleColor]$ForegroundColor
    [ConsoleColor]$BackgroundColor
    [string]$Icon
    [bool]$IsExitItem

    MenuItem(
        [string]$label, 
        [scriptblock]$action, 
        [ConsoleColor]$foregroundColor = 'White', 
        [ConsoleColor]$backgroundColor = 'Black', 
        [string]$icon = '', 
        [bool]$isExitItem = $false
    ) {
        $this.Label           = $label
        $this.Action          = $action
        $this.ForegroundColor = $foregroundColor
        $this.BackgroundColor = $backgroundColor
        $this.Icon            = $icon
        $this.IsExitItem      = $isExitItem
    }

    [void]Invoke() {
        & $this.Action | Out-Host
    }
}