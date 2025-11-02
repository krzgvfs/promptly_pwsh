class MenuItem {
    [string]$Label
    [scriptblock]$Action

    MenuItem([string]$label, [scriptblock]$action) {
        $this.Label  = $label
        $this.Action = $action
    }

    [void]Invoke() {
        & $this.Action
    }
}