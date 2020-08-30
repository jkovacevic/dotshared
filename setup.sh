#!/bin/bash
create_symlink() {
    dotfile="$1"
    target="$2"
    echo "Creating symlink $target -> $dotfile"
    if [ -f "$target" ] || [ -L "$target" ]; then
        sudo rm "$target"
    fi;
	# Create folders in case they do not exist
	mkdir -p $(dirname "${target}")
    sudo ln -s "$dotfile" "$target"
}


echo "## Setup applications ##"
create_symlink "$HOME/dotshared/display/display-laptop.desktop" "$HOME/.local/share/applications/display-laptop.desktop"
create_symlink "$HOME/dotshared/display/display-hdmi.desktop" "$HOME/.local/share/applications/display-hdmi.desktop"
create_symlink "$HOME/dotshared/display/display-extend.desktop" "$HOME/.local/share/applications/display-extend.desktop"
create_symlink "$HOME/dotshared/display/audio-laptop.desktop" "$HOME/.local/share/applications/audio-laptop.desktop"
create_symlink "$HOME/dotshared/display/audio-hdmi.desktop" "$HOME/.local/share/applications/audio-hdmi.desktop"
create_symlink "$HOME/dotshared/display/audio-jabra.desktop" "$HOME/.local/share/applications/audio-jabra.desktop"

create_symlink "$HOME/dotshared/applications/microphone.desktop" "$HOME/.local/share/applications/microphone.desktop"
create_symlink "$HOME/dotshared/applications/ocr-de.desktop" "$HOME/.local/share/applications/ocr-de.desktop"
create_symlink "$HOME/dotshared/applications/ocr.desktop" "$HOME/.local/share/applications/ocr.desktop"
create_symlink "$HOME/dotshared/applications/screenshot.desktop" "$HOME/.local/share/applications/screenshot.desktop"
create_symlink "$HOME/dotshared/applications/television.desktop" "$HOME/.local/share/applications/television.desktop"
create_symlink "$HOME/dotshared/applications/video.desktop" "$HOME/.local/share/applications/video.desktop"
create_symlink "$HOME/dotshared/applications/startup-laptop.desktop" "$HOME/.local/share/applications/startup-laptop.desktop"
create_symlink "$HOME/dotshared/applications/startup-keyboard.desktop" "$HOME/.local/share/applications/startup-keyboard.desktop"

create_symlink "$HOME/dotshared/perl/keyboard-select" "/usr/lib/urxvt/perl/keyboard-select"
create_symlink "$HOME/dotshared/bash/sxiv-key.sh" "$HOME/.config/sxiv/exec/key-handler"
create_symlink "$HOME/dotshared/tmux/tmux.conf" "$HOME/.tmux.conf"
create_symlink "$HOME/dotshared/python/file_format.py" "$HOME/.local/bin/ff"
create_symlink "$HOME/dotshared/python/ipython.py" "$HOME/.ipython/profile_default/ipython_config.py"
create_symlink "$HOME/dotshared/config/micro-bindings.json" "$HOME/.config/micro/bindings.json"
create_symlink "$HOME/dotshared/config/dunstrc" "$HOME/.config/dunst/dunstrc"