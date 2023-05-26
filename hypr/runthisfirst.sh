#Hyprland

directory=$HOME/.config
folders=("alacritty" "mako" "swappy" "swaylock" "waybar" "wlogout" "wofi" "cava")

for folder in "${folders[@]}"; do
    if [ ! -d "$directory/$folder" ]; then
        echo "Creating folder: $folder"
        mkdir "$directory/$folder"
    else
        echo "Folder already exists: $folder"
    fi
done


#Terminal
# ln -sf ~/.config/arch.config/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/.config/hypr/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

#Audio Visualizer
ln -sf ~/.config/hypr/cava/config ~/.config/cava/config

#Notification 
ln -sf ~/.config/hypr/mako/config ~/.config/mako/config

#Screenshot
ln -sf ~/.config/hypr/swappy/config ~/.config/swappy/config


#Lock screen
ln -sf ~/.config/hypr/swaylock/config ~/.config/swaylock/config

#Bar
ln -sf ~/.config/hypr/waybar/config ~/.config/waybar/config
ln -sf ~/.config/hypr/waybar/style.css ~/.config/waybar/style.css


#Lock out
ln -sf ~/.config/hypr/wlogout/layout ~/.config/wlogout/layout


#Application launcher
ln -sf ~/.config/hypr/wofi/* ~/.config/wofi/

