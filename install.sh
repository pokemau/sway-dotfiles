#!/bin/bash

# APPS
sudo dnf install ark zsh neovim tmux gh gcc gcc-c++ alacritty 
cmake nodejs qbittorrent vlc flatseal lxappearance obs-studio qt5ct
steam fedora-workstation-repositories flatpak

# CHROME
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable

# VSCODE
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=0\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code -y

# FLATPAKS
flatpak install flathub com.discordapp.Discord #discord


echo "LOG IN TO GITHUB"
gh auth login

echo "OH MY ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/pokemau/sway-dotfiles.git 
cd dotfiles

cp .tmux.conf .zshrc ~/
cp -r .icons/ .themes/ ~/
cp -r fonts/* ~/.local/share/fonts

cd .config
cp -r alacritty dunst kitty nvim rofi sway swaylock waybar xfce4 ~/.config


CURSOR="Bibata-Modern-Ice"
ICON="Tela-circle-purple"
THEME="Graphite-Mono"

# Theme, icons, cursors & colors
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface gtk-theme "$THEME"
gsettings set org.gnome.desktop.interface icon-theme "$ICON"
gsettings set org.gnome.desktop.interface cursor-theme "$CURSOR"


sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icons

sudo flatpak override --env=GTK_THEME=$THEME
sudo flatpak override --env=ICON_THEME=$CURSOR

# gsettings set org.cinnamon.desktop.interface icon-theme "Papirus-Dark"
# gsettings set org.cinnamon.desktop.interface icon-theme-backup "Papirus-Dark"
# gsettings set org.cinnamon.desktop.interface cursor-theme "phinger-cursors-dark"
# gsettings set org.cinnamon.desktop.interface gtk-theme "Adwaita"
# gsettings set org.cinnamon.desktop.interface gtk-theme-backup "Adwaita"
# gsettings set org.x.apps.portal color-scheme "prefer-dark"
# gsettings set org.gtk.Settings.ColorChooser custom-colors "[(0.81568627450980391, 0.81176470588235294, 0.80000000000000004, 1.0), (0.20000000000000001, 0.7803921568627451, 0.87058823529411766, 1.0), (0.16470588235294117, 0.63137254901960782, 0.70196078431372544, 1.0), (0.63921568627450975, 0.27843137254901962, 0.72941176470588232, 1.0), (0.16470588235294117, 0.4823529411764706, 0.87058823529411766, 1.0), (0.070588235294117646, 0.28235294117647058, 0.54509803921568623, 1.0), (0.9882352941176471, 0.9137254901960784, 0.30980392156862746, 1.0), (0.9137254901960784, 0.67843137254901964, 0.047058823529411764, 1.0)]"
#
# Fonts
# gsettings set org.nemo.desktop font "Roboto 10"
gsettings set org.gnome.desktop.interface font-name "Roboto 10"
gsettings set org.gnome.desktop.interface document-font-name "Roboto 10"
# gsettings set org.cinnamon.desktop.wm.preferences titlebar-font "Sans Bold 10"
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Sans Bold 10"
gsettings set org.gnome.desktop.interface monospace-font-name "Fira Code 10"

# Font render settings
gsettings set org.gnome.desktop.interface font-antialiasing "subpixel"
gsettings set org.gnome.desktop.interface font-hinting "full"
gsettings set org.gnome.desktop.interface font-rgba-order "rgb"
#Note: Depending on your screen specifications, you may want to change hinting or pixel order.


# Other things
gsettings set org.gnome.desktop.interface enable-animations true
#gsettings set org.gnome.desktop.interface clock-format "24h"
#gsettings set org.gtk.Settings.FileChooser clock-format "24h"
# # Note: You may want to change time order to 12h if you're American.
