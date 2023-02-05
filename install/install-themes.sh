#!/usr/bin/bash
# Installs themes

# Used to store certain states
mkdir -p $HOME/.config
mkdir -p $HOME/.config/papirus-folders

# Set gtk themes
gsettings set org.gnome.desktop.interface gtk-theme "Materia-dark-compact"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface font-name "Hack 10"
gsettings set org.gnome.desktop.interface document-font-name "Hack 10"
gsettings set org.gnome.desktop.interface monospace-font-name "Hack 10"

# Change papirus folder color
if [ ! -f "$HOME/.config/papirus-folders/theme-updated" ]; then
	cd /tmp/
	git clone https://github.com/PapirusDevelopmentTeam/papirus-folders.git
	cd papirus-folders
	git pull
	./papirus-folders -C black --theme Papirus-Dark
	touch $HOME/.config/papirus-folders/theme-updated
fi

# Copy configs to config directory
SCRIPT_DIR=$(dirname $0)
CONFIG_DIR=$SCRIPT_DIR/../config

# $1 - From directory
# $2 - To directory
sync () {
	# Sync new file
	rsync -ar $1 $2
	rename 'dot-' '.' $2*
}

for config in $(ls -A $CONFIG_DIR); do
	echo "Syncing config/$config"
	sync $CONFIG_DIR/$config $HOME/.config/
done

# Set wallpaper
SCRIPT_DIR=$(dirname $0)
$SCRIPT_DIR/set-wallpaper.sh $SCRIPT_DIR/../wallpapers/cosmic_4_3.svg

echo "Done!"
