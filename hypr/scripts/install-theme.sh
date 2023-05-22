#!/bin/bash

# Create the ~/.themes and ~/.local/share/icons if it doesn't exist

if [ ! -d ~/.XCompose ]; then
    cp ~/.config/hypr/.XCompose ~/
    echo "~/.XCompose created"
else
    echo "~/.XCompose already exists"
fi


if [ ! -d ~/.themes ]; then
    mkdir -p ~/.themes
    echo "Directory created: ~/.themes"
else
    echo "Directory already exists: ~/.themes"
fi

if [ ! -d ~/.local/share/icons ]; then
    mkdir -p ~/.local/share/icons
    echo "Directory created: ~/.local/share/icons"
else
    echo "Directory already exists: ~/.local/share/icons"
fi

if [ ! -d ~/Pictures/Screenshots/ ]; then
    mkdir -p ~/Pictures/Screenshots/
    echo "Directory created: ~/Pictures/Screenshots/"
else
    echo "Directory already exists: ~/Pictures/Screenshots/"
fi


#install git
if ! command -v git &> /dev/null; then
  echo "Git is not installed. Installing Git..."
  sudo pacman -Sy --noconfirm git
  echo "Git has been installed."
else
  echo "Git is already installed."
fi

# Download theme WhiteSur-gtk
if [ ! -d ~/.themes/WhiteSur-gtk-theme ] && [ ! -d ~/.themes/WhiteSur-Dark ]; then
  echo "Cloning WhiteSur-gtk repository..."
  git clone "https://github.com/vinceliuice/WhiteSur-gtk-theme.git" && mv WhiteSur-gtk-theme ~/.themes
  echo "Repository cloned."
else
  echo "folder already exists. Skipping clone operation."
fi

for file in ~/.themes/WhiteSur-gtk-theme/release/*.tar.xz; do
  echo "Extracting $file..."
  tar -xf "$file" -C ~/.themes/WhiteSur-gtk-theme/release/
done

cp -R ~/.themes/WhiteSur-gtk-theme/release/WhiteSur-Dark ~/.themes/
# rm -rf ~/.themes/WhiteSur-gtk-theme


# Download theme Orchis-theme
if [ ! -d ~/.themes/Orchis-theme ]; then
  echo "Cloning Orchis repository..."
  git clone "https://github.com/vinceliuice/Orchis-theme.git" && mv Orchis-theme ~/.themes
  echo "Repository cloned."
else
  echo "folder already exists. Skipping clone operation."
fi

for file in ~/.themes/Orchis-theme/release/*.tar.xz; do
    echo "Extracting $file..."
    tar -xf "$file" -C ~/.themes/Orchis-theme/release/
done

cp -R ~/.themes/Orchis-theme/release/Orchis-Dark ~/.themes/
# rm -rf ~/.themes/Orchis-theme


# Download icon kora
if [ ! -d ~/.local/share/icons/kora ]; then
  echo "Cloning Orchis repository..."
  git clone "https://github.com/bikass/kora.git" && mv kora ~/.local/share/icons/
  echo "Repository cloned."
else
  echo "folder already exists. Skipping clone operation."
fi

cp -R ~/.local/share/icons/kora/kora ~/.local/share/icons





# set theme 
gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Dark"

# set ieon
gsettings set org.gnome.desktop.interface icon-theme "kora"