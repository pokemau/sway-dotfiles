#!/bin/bash

# ENABLE FLATPAK
sudo dnf install flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# APPS
sudo dnf install -y ark kitty zsh neovim tmux gh gcc gcc-c++ alacritty \
cmake nodejs qbittorrent vlc flatseal lxappearance obs-studio qt5ct \
steam fedora-workstation-repositories cargo dconf-editor gnome-clocks \
ddccontrol ddccontrol-gui

# CHROME
#sudo dnf config-manager --set-enabled google-chrome
#sudo dnf install google-chrome-stable -y

# VSCODE
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code -y

cp -r .icons/ .themes/ .tmux.conf ~/
cp -r fonts/ ~/.local/share/

cp -r wallpapers/ ~/Pictures

cd .config
cp -r alacritty dunst kitty nvim rofi sway swaylock waybar xfce4 ~/.config

echo "OH MY ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ../.zshrc ~
