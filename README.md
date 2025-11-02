# PSPromptly

> PowerShell framework for creating command-line automations.

![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey)
![Status](https://img.shields.io/badge/Status-In%20development-yellow)

---

## 📖 Overview

**PSPromptly** is a framework that assists in creating **interactive command-line applications**.

It was designed to be **modular, extensible, and user-friendly**, allowing independent commands used in everyday applications to compose a complete application with minimal code.

---

## 📦 Installation

### PowerShell Gallery (Recommended)

```powershell
Install-Module -Name PSPromptly -Scope CurrentUser -Force
```

---

## 🐈 How to use

Here is a basic example of how to create and display an interactive menu.

```powershell
# Usage.ps1

# 1. Import the module
Import-Module PSPromptly

# 2. Define the actions (script blocks) for your menu items
$action1 = { Write-Host "You chose the first option! Running a script..." }
$action2 = { Start-Process "https://github.com/krzgvfs/promptly_pwsh" }

# 3. Create an array of MenuItem objects
$menuItems = @(
    [MenuItem]::new("Run a local script", $action1)
    [MenuItem]::new("Open project page", $action2)
    [MenuItem]::new("Do nothing (exit)", { return })
)

# 4. Display the menu to the user
Show-Menu -Items $menuItems -Title "✨ Main Menu ✨"

```

---

## ✨ Resources

- 🧭 Creating declarative menus 
- 🎨 Support for flexible **themes and layouts**  
- ↗️ Input capture via keyboard (arrow keys, Enter, Esc, etc.) 
- 🧩 Object-oriented structure with `Menu` and `MenuItem` classes.  
- 🧱 Extensible for larger systems (e.g., automation CLI)  
