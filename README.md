# 🐧 Dotfiles
This repository contains my **dotfiles** since February 2026, focused on a modern, minimal, and consistent environment using the **Gruvbox theme** across the entire system.

---
## 🎨 Theme
Uses **Gruvbox**, with an aesthetic that is:
- Easy on the eyes  
- Focused on visual comfort  
- Consistent across all tools  

---
## 📸 Preview
![preview1.jpg](preview1.jpg)
![preview2.jpg](preview2.jpg)

---
## 🧰 Tools
- **WM:** i3wm
- **Bar:** polybar
- **Launcher:** dmenu
- **Terminal:** kitty
- **Shell:** zsh
- **Editor:** nvim
- **Git UI:** lazygit
- **Fetch:** fastfetch

---
## 🛠️ Installation
My dotfiles setup includes two automatic install scripts: one for **Arch-based** distributions and one for **Debian‑based** distributions
They will fully configure your environment with my preferred tools, themes, and dotfiles
 **THIS SCRIPT DOESNT DO A BACKUP! Make sure to backup everything before using the script **

### ⚙️ What the scripts do
- **Updating your system** – runs `pacman -Syu` (Arch) or `apt update && apt upgrade` (Debian)
- **Core packages** – install i3wm, polybar, kitty, nvim (with lazyvim), tmux, zsh, lazygit, etc
- **Additional packages** – apps like Whatsie, Discord, Spotify, Obsidian, Syncthing, etc
- **Setting up** – creates symbolic links from ~/dotfiles.
- **Environment** – changes your default shell to `zsh` and configure Flathub.
- (Arch only) Uses yay for non-official-repository packages
- (Debian only) Uses snap for non-official-repository packages

### 🚀 Installation steps
The scripts expect the repository to be exactly at `~/dotfiles`

```bash
git clone https://github.com/bcsarah/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash install-arch.sh # for arch-based
bash install-deb.sh  # for debian-based
```

- After the installation is finished, i3wm, polybar, kitty terminal, shell and other configurations will be active after you log out and back in the right environment (i3)

### ⚠️ Notes && Troubleshooting
- **replace existing configs** - The scripts replace existing configuration folders (i3, polybar, kitty, nvim, lazygit, tmux). If you have configurations you want to keep, back them up first
- **YAY** - The Arch script installs the yay AUR helper
- **SNAP** - The Debian script installs snap and uses it for lazygit, nvim, and glow
- **All scripts run with sudo** – you will be asked for your password and others during the installation
- **~/dotfiles not found** – the repository must be cloned exactly to ~/dotfiles
- **Permission errors** – make sure you have sudo rights and are connected to the internet
- **Missing packages** – some packages may have different names on very old or minimal distributions. If a package is not found, the script will skip it – you can then install that package manually

---
## ❤️ Made with love
This dotfiles was crafted with a lot of love and care for those who want a setup similar to mine (or mine btw).
> Better use linux btw. 🐧
