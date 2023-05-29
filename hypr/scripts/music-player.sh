#!/bin/bash

# ## 1 folder duoc chi dinh
# CONFIG="$HOME/.config/wofi/config"
# STYLE="$HOME/.config/wofi/style.css"
# COLORS="$HOME/.config/wofi/colors"

# ## Wofi Command
# wofi_command="wofi --show dmenu \
#             --conf ${CONFIG} --style ${STYLE} --color ${COLORS} \
#             --width=350 --height=380 \
#             --cache-file=/dev/null \
#             --hide-scroll --no-actions \
#             --define=matching=fuzzy"


# notification(){
#   notify-send "Now Playing: Lofi Radio"
# }

# menu(){
#   # Get the list of music files in the music folder
#   music_files=$(find "$HOME/Music" -type f -name "*.mp3" -o -name "*.flac" -o -name "*.wav")

#   # Loop through the music files and display them in the menu
#   while IFS= read -r file; do
#     printf "%s\n" "$(basename "$file")"
#   done <<< "$music_files"
# }

# main() {
#   choice=$(menu | ${wofi_command})

#   if [[ -n "$choice" ]]; then
#     # Play the selected music file
#     notification
#     mpv "$HOME/Music/$choice"
#   else
#     # No file selected
#     notify-send "No music file selected."
#   fi
# }

# pkill -f http && notify-send "Lofi Radio stopped" || main &


# ## toan bo folder trong 1 thu muc nhat dinh
# CONFIG="$HOME/.config/wofi/config"
# STYLE="$HOME/.config/wofi/style.css"
# COLORS="$HOME/.config/wofi/colors"

# ## Wofi Command
# wofi_command="wofi --show dmenu \
#             --conf ${CONFIG} --style ${STYLE} --color ${COLORS} \
#             --width=350 --height=380 \
#             --cache-file=/dev/null \
#             --hide-scroll --no-actions"


# notification(){
#   notify-send "Now Playing: $choice"
# }

# menu(){
#   # Get the list of folders in the Music directory
#   folders=$(find "/run/media/huy/data/music/" -mindepth 1 -type d)

#   # Loop through the folders and display them in the menu
#   while IFS= read -r folder; do
#     printf "%s\n" "$(basename "$folder")"
#   done <<< "$folders"
# }

# sub_menu(){
#   folder_path="/run/media/huy/data/music/$1"
  
#   # Get the list of music files in the selected folder
#   music_files=$(find "$folder_path" -type f -name "*.mp3")

#   # Loop through the music files and display them in the sub-menu
#   while IFS= read -r file; do
#     printf "%s\n" "$(basename "$file")"
#   done <<< "$music_files"
# }

# main() {
#   folder=$(menu | ${wofi_command})

#   if [[ -n "$folder" ]]; then
#     choice=$(sub_menu "$folder" | ${wofi_command})
    
#     if [[ -n "$choice" ]]; then
#       # Play the selected music file
#       notification
#       mpv "/run/media/huy/data/music/$folder/$choice" --no-audio-display --loop-file
#     else
#       # No music file selected
#       notify-send "No music file selected."
#     fi
#   else
#     # No folder selected
#     notify-send "No folder selected."
#   fi
# }

# pkill -f mpv && notify-send "$choice stopped" || main

CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/style.css"
COLORS="$HOME/.config/wofi/colors"

# wofi_command="wofi --show dmenu \
#             --conf ${CONFIG} --style ${STYLE} --color ${COLORS} \
#             --width=350 --height=380 \
#             --cache-file=/dev/null \
#             --hide-scroll --no-actions" 

wofi_command="rofi -dmenu -i -p "Media:" -theme ~/.config/rofi/launchers/type-2/style-1 -fuzzy" 

notification() {
  notify-send "Now Playing: $choice"
}

folder1="/run/media/huy/data/music/Music/"
folder2="/run/media/huy/data/music/Nhạc không lời/"
folder3="/run/media/huy/data/B2 hören/Deutsch intensiv Hören & Sprechen B2/"


menu() {
  # Define the folders to choose from
  folders=(
    "$folder1"
    "$folder2"
    "$folder3"
  )

  # Loop through the folders and display their names in the menu
  for folder in "${folders[@]}"; do
    printf "%s\n" "$(basename "$folder")"
  done
}

sub_menu() {
  folder_path="$1"

  # Get the list of music files in the selected folder
  music_files=$(find "$folder_path" -type f -name "*" | sort)

  # Loop through the music files and display their names in the sub-menu
  while IFS= read -r file; do
    printf "%s\n" "$(basename "$file")"
  done <<< "$music_files"
}

main() {
  folder=$(menu | ${wofi_command})

  if [[ -n "$folder" ]]; then
    folder_path=""

    if [[ "$folder" == "$(basename "$folder1")" ]]; then
      folder_path+="$folder1"
    elif [[ "$folder" == "$(basename "$folder2")" ]]; then
      folder_path+="$folder2"
    elif [[ "$folder" == "$(basename "$folder3")" ]]; then
      folder_path+="$folder3"
    fi

    choice=$(sub_menu "$folder_path" | ${wofi_command})

    if [[ -n "$choice" ]]; then
      # Play the selected music file
      notification
      # mpv "$folder_path/$choice" --no-audio-display --loop-file
      mpv --no-audio-display --loop-playlist --loop-file "$folder_path/$choice"
    else
      # No music file selected
      notify-send "No music file selected."
    fi
  else
    # No folder selected
    notify-send "No folder selected."
  fi
}

pkill -f mpv && notify-send "$choice stopped" || main