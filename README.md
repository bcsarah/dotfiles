# 🐧 Dotfiles
This repository contains my **dotfiles** since February 2026, focused on a modern, minimal, and consistent environment using the **Gruvbox theme** across the entire system

---
## 🎨 Theme
Uses **Gruvbox**, with an aesthetic that is:
- Easy on the eyes
- Focused on visual comfort
- Consistent across all tools

---
## 🧰 Tools
- **Terminal:** kitty
- **Shell:** zsh
- **Editor:** vim
- **Git UI:** lazygit
- **Fetch:** fastfetch

---
## 🛠️ Installation
Just run install.sh and see what you need to do. **This script is under development and testing.**
**THIS SCRIPT DOESNT DO A BACKUP! Make sure to backup everything before using the script**

### ⚙️  What the scripts do
1. Updates the system
2. Install core packages (vim, lazygit etc)
5. Creates symbolic links from ~/dotfiles
6. Changes your default shell to `zsh`
- (personally, i recommend you view the entire install.sh to make sure what this script can do)

### 🚀 Installation steps
The scripts expect the repository to be exactly at `~/dotfiles`

```bash
git clone https://github.com/bcsarah/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

---
## ❤️ Made with love
This dotfiles was made with a lot of love and care for those who want a setup similar to mine (or mine btw)
> Better use linux btw 🐧
