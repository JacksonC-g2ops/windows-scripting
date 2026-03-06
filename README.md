# Windows Scripting Utilities

A small collection of **PowerShell automation scripts** designed to provide **fast keyboard-driven access to common Windows locations and behaviors**.

The goal of this repository is to improve productivity by allowing users to quickly open commonly used directories using:

- Desktop shortcuts
- Keyboard hotkeys
- Lightweight PowerShell scripts

Instead of navigating through File Explorer manually, these scripts allow you to jump directly to important locations with a **single key combination**.

---

# 📂 Repository Scripts

| Script | Description | Suggested Hotkey |
|------|------|------|
| `Cdrive.ps1` | Opens the root of the C drive | `C` |
| `launch3windows.ps1` | Opens Desktop, Downloads, and Documents | `3` |
| `launchOneDriveDocuments.ps1` | Opens the OneDrive Documents folder | `D` |
| `restorewin10explorer.ps1` | Restores Windows 10 style context menu behavior | Optional |

---

## `launch3windows.ps1`

Launches three commonly used Windows directories:

- Desktop
- Downloads
- Documents

### Use Case

This script is useful when working across multiple commonly used directories. With a shortcut and hotkey assigned, all three locations open instantly in File Explorer.

---

## `Cdrive.ps1`

Opens the root of the **C:\ drive**.

### Use Case

This script is useful for users who frequently access:

- system directories
- development folders
- program installations
- scripting environments

It provides immediate access to the root of the filesystem.

---

## `launchOneDriveDocuments.ps1`

Opens the **Documents folder stored inside OneDrive**.

### Use Case

Many organizations store documents inside OneDrive for synchronization and backup. This script provides fast access to the synced **OneDrive Documents directory**.

---

## `restorewin10explorer.ps1` *(Optional)*

This script restores certain **Windows 10 style behaviors** within Windows 11.

It modifies user registry keys to:

1. Restore the **classic right-click context menu**
2. Remove the Windows 11 simplified menu behavior

Windows 11 introduced a compact right-click menu that hides many options behind **"Show more options"**. This script restores the classic menu so all options appear immediately.

### Registry Key Used
HKEY_CURRENT_USER\Software\Classes\CLSID{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}

Subkey: InprocServer32


Leaving the default value empty causes Windows Explorer to fall back to the **legacy context menu**.

> This script is **optional**.  
> If you prefer the default Windows 11 interface, you do **not need to run it**.

---

# ⚡ Creating Desktop Shortcuts

These scripts are designed to run through **Windows shortcuts**.

## Steps

1. Right-click on your **Desktop**
2. Select **New → Shortcut**
3. In the **Location field**, enter:
powershell.exe -ExecutionPolicy Bypass -File "FULL_PATH_TO_SCRIPT.ps1"

Example:
powershell.exe -ExecutionPolicy Bypass -File "C:\windows-scripting\Cdrive.ps1"

4. Click **Next**
5. Name the shortcut
6. Click **Finish**

Your shortcut is now created.

---

# ⌨️ Assigning Keyboard Hotkeys

Windows allows shortcuts to launch using keyboard shortcuts.

## Steps

1. Right-click the shortcut
2. Select **Properties**
3. Click the **Shortcut** tab
4. Click inside the **Shortcut Key** field
5. Press the key you want to assign
6. Click **Apply**

Windows will automatically prepend **Ctrl + Alt** to the key you press.

Example:

Pressing
C

automatically becomes
Ctrl + Alt + C

---

# 🔑 Suggested Hotkeys

| Script | Key Press | Result |
|------|------|------|
| `Cdrive.ps1` | `C` | `Ctrl + Alt + C` |
| `launch3windows.ps1` | `3` | `Ctrl + Alt + 3` |
| `launchOneDriveDocuments.ps1` | `D` | `Ctrl + Alt + D` |

These keys are **only suggestions**.

Any key can be used, and Windows will automatically convert it into a **Ctrl + Alt + Key combination**.

---

# 🧠 Example Workflow

Example productivity setup:
Ctrl + Alt + C → Open C Drive
Ctrl + Alt + 3 → Open Desktop, Downloads, and Documents
Ctrl + Alt + D → Open OneDrive Documents


This allows instant navigation without manually opening File Explorer.

---

# 🖥 Requirements

- Windows 10 or Windows 11
- PowerShell (included by default with Windows)

---

# 📁 Repository Structure
windows-scripting
│
├── Cdrive.ps1
├── launch3windows.ps1
├── launchOneDriveDocuments.ps1
├── restorewin10explorer.ps1
│
├── Cdrive_shortcut_instructions.txt
├── launch3windows_shortcut_instructions.txt
├── launchOneDriveDocuments_shortcut_instructions.txt


---

# 🚀 Future Improvements

Possible future additions:

- additional directory launcher scripts
- parameterized scripts
- logging features
- packaging scripts as a PowerShell module
- developer environment launch scripts
