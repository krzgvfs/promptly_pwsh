class MenuTheme {
    [ConsoleColor]$AsciiArtColor
    [ConsoleColor]$TitleColor
    [ConsoleColor]$MenuTextColor
    [ConsoleColor]$MenuBackgroundColor
    [ConsoleColor]$SelectionBackgroundColor

    MenuTheme(
        [ConsoleColor]$asciiArtColor,
        [ConsoleColor]$titleColor,
        [ConsoleColor]$menuTextColor,
        [ConsoleColor]$menuBackgroundColor,
        [ConsoleColor]$selectionBackgroundColor
    ) {
        $this.AsciiArtColor = $asciiArtColor
        $this.TitleColor = $titleColor
        $this.MenuTextColor = $menuTextColor
        $this.MenuBackgroundColor = $menuBackgroundColor
        $this.SelectionBackgroundColor = $selectionBackgroundColor
    }
}

function New-MenuTheme {
    [CmdletBinding()]
    param(
        [ConsoleColor]$AsciiArtColor = 'Cyan',
        [ConsoleColor]$TitleColor = 'White',
        [ConsoleColor]$MenuTextColor = 'White',
        [ConsoleColor]$MenuBackgroundColor = 'Black',
        [ConsoleColor]$SelectionBackgroundColor = 'Green'
    )

    return [MenuTheme]::new(
        $AsciiArtColor,
        $TitleColor,
        $MenuTextColor,
        $MenuBackgroundColor,
        $SelectionBackgroundColor
    )
}