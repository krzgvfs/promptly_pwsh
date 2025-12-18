# PSPromptly

> PowerShell module for creating beautiful interactive command-line menus with minimal code.

![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey)
![Status](https://img.shields.io/badge/Status-In%20development-yellow)
![Version](https://img.shields.io/badge/Version-0.1.2-orange)

---

## 📖 Overview

**PSPromptly** is a lightweight PowerShell module for creating **interactive command-line menus** with keyboard navigation, custom themes, and ASCII art support.

Designed to be **modular, extensible, and developer-friendly**, PSPromptly lets you transform simple script blocks into polished interactive CLI applications with just a few lines of code.

### Key Features

- **Easy menu creation** with `New-MenuItem` and `Show-Menu`
- **Keyboard navigation** (Arrow keys, Enter, Esc)
- **Custom themes** with `New-MenuTheme`
- **ASCII art headers** for visual appeal
- **Exit items** with `New-ExitMenuItem`
- **Custom icons and colors** per menu item
- **Cross-platform** support (Windows, Linux, macOS)

---

## 📦 Installation

### From Source (Current)

```powershell
git clone https://github.com/krzgvfs/promptly_pwsh.git
cd promptly_pwsh
Import-Module ./PSPromptly.psd1 -Force
```

### PowerShell Gallery (Coming Soon)

```powershell
Install-Module -Name PSPromptly -Scope CurrentUser -Force
```

---

## 🚀 Quick Start

Here's a complete example to get you started:

```powershell
# Import the module
Import-Module -Name "PSPromptly" -Force

# Define actions for your menu items
$action1 = { Write-Host "Running first action..." }
$action2 = { Get-Process | Select-Object -First 5 }
$action3 = { Start-Process "https://github.com" }

# Create menu items
$menuItems = @(
    New-MenuItem -Label "Run a script" -Action $action1 -Icon "⚡"
    New-MenuItem -Label "Show processes" -Action $action2 -Icon "📊"
    New-MenuItem -Label "Open GitHub" -Action $action3 -Icon "🌐"
    New-ExitMenuItem -ForegroundColor Red
)

# Display the menu
Show-Menu -Items $menuItems -Title "Main Menu"
```

---

## 🎨 Advanced Usage

### Custom Themes

Create beautiful custom themes to match your style:

```powershell
$theme = New-MenuTheme `
    -AsciiArtColor Magenta `
    -TitleColor White `
    -MenuTextColor Gray `
    -MenuBackgroundColor Black `
    -SelectionBackgroundColor Yellow

Show-Menu -Items $menuItems -Title "Styled Menu" -Theme $theme
```

### ASCII Art Headers

Add visual flair with ASCII art:

```powershell
$asciiArt = @"
 ███╗   ███╗██╗   ██╗    ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
 ████╗ ████║╚██╗ ██╔╝    ████╗ ████║██╔════╝████╗  ██║██║   ██║
 ██╔████╔██║ ╚████╔╝     ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
 ██║╚██╔╝██║  ╚██╔╝      ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
 ██║ ╚═╝ ██║   ██║       ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
 ╚═╝     ╚═╝   ╚═╝       ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝
"@

Show-Menu -Items $menuItems -Title "My App" -AsciiArt $asciiArt -Theme $theme
```

### Complete Example

Check out [demo.ps1](demo.ps1) for a full working example with all features.

---

## 📚 API Reference

### Functions

#### `New-MenuItem`
Creates a new menu item with an action.

```powershell
New-MenuItem -Label "Item Label" -Action { Write-Host "Action" } [-Icon "🔹"] [-ForegroundColor "White"]
```

**Parameters:**
- `Label` - Display text for the menu item
- `Action` - ScriptBlock to execute when selected
- `Icon` - Optional icon/emoji to display
- `ForegroundColor` - Text color (default: White)

#### `New-ExitMenuItem`
Creates a menu exit item.

```powershell
New-ExitMenuItem [-Label "Exit"] [-Icon "🚪"] [-ForegroundColor "Red"]
```

#### `New-MenuTheme`
Creates a custom theme for the menu.

```powershell
New-MenuTheme `
    [-AsciiArtColor "Cyan"] `
    [-TitleColor "White"] `
    [-MenuTextColor "White"] `
    [-MenuBackgroundColor "Black"] `
    [-SelectionBackgroundColor "Green"]
```

#### `Show-Menu`
Displays an interactive menu.

```powershell
Show-Menu -Items $menuItems [-Title "Menu Title"] [-AsciiArt $art] [-Theme $theme]
```

**Parameters:**
- `Items` - Array of MenuItem objects
- `Title` - Menu title (optional)
- `AsciiArt` - ASCII art header (optional)
- `Theme` - MenuTheme object (optional)

#### `Select-Option`
Low-level function for single option selection. Returns the selected item's label.

```powershell
$selectedLabel = Select-Option -Items $menuItems [-Title "Choose"] [-AsciiArt $art] [-Theme $theme]
```

---

## 🎮 Keyboard Controls

| Key | Action |
|-----|--------|
| `↑` | Move selection up |
| `↓` | Move selection down |
| `Enter` or `→` | Select current item |
| `Esc` | Exit menu |

---

## 🏗️ Project Structure

```
PSPromptly/
├── src/
│   ├── Core/
│   │   ├── Menu.ps1          # Main menu logic (Show-Menu, Select-Option)
│   │   ├── MenuItem.ps1      # MenuItem class definition
│   │   └── New-MenuItem.ps1  # MenuItem factory functions
│   └── UI/
│       ├── Input.ps1         # Keyboard input handling
│       ├── Render.ps1        # Menu rendering
│       └── Style.ps1         # MenuTheme class and theming
├── tests/
│   └── SelectOption.tests.ps1
├── demo.ps1                  # Full featured example
├── PSPromptly.psd1          # Module manifest
└── PSPromptly.psm1          # Module entry point
```

---

## 🛠️ Development

### Running Tests

```powershell
Invoke-Pester ./tests/
```

### Building

```powershell
./build.ps1
```

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License.

---

## 👤 Author

**Marcos Santos**

- GitHub: [@krzgvfs](https://github.com/krzgvfs)
- Project: [PSPromptly](https://github.com/krzgvfs/promptly_pwsh)

---

## 🌟 Show Your Support

If you find this project useful, please consider giving it a star on GitHub!  
