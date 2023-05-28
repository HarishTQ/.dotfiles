#!/bin/sh

# Helper Functions

update() { sudo apt update && sudo apt upgrade; }
aptInstall(){ sudo apt install "$1"; }

installEssentials(){
	aptInstall curl;
	aptInstall wget;
	aptInstall git;
	aptInstall gnome-tweaks;
	aptInstall ubuntu-restricted-extras;
	aptInstall vlc;
	aptInstall stacer;
	aptInstall stow;
}

installChrome(){
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;
	aptInstall ./google-chrome-stable_current_amd64.deb
}

installVScode(){
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
	sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
	rm -f packages.microsoft.gpg
	aptInstall apt-transport-https
	update
	aptInstall code
}


installSpotify(){
	curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
	echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get update && sudo apt-get install spotify-client
}

setupFlatpak(){
	aptInstall flatpak
	aptInstall gnome-software-plugin-flatpak
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	flatpak install flathub com.github.tchx84.Flatseal
}

installGithubDesktop(){
	flatpak install flathub io.github.shiftey.Desktop
}

installAlacritty(){
	update;
	sudo add-apt-repository ppa:aslatter/ppa -y;
	aptInstall alacritty;
}

installDiscord(){
	flatpak install flathub com.discordapp.Discord
}

installExtensionManager(){
	flatpak install flathub com.mattjakeman.ExtensionManager
}

removeSnap(){
	sudo snap remove --purge firefox
	sudo snap remove --purge snap-store
	sudo snap remove --purge gnome-3-38-2004
	sudo snap remove --purge gtk-common-themes
	sudo snap remove --purge snapd-desktop-integration
	sudo snap remove --purge bare
	sudo snap remove --purge core20
	sudo snap remove --purge snapd
	sudo apt remove --autoremove snapd
	rm -rf ~/snap
	sudo rm -rf /snap
	sudo rm -rf /var/snap
	sudo rm -rf /var/lib/snapd
}

installObsidian(){
	flatpak install flathub md.obsidian.Obsidian;
}

installI3(){
	aptInstall i3
}

#update
#installEssentials
#installChrome
#installVScode
#installSpotify
#setupFlatpak
#installGithubDesktop
#installAlacritty
#installDiscord
#installExtensionManager
#removeSnap
#installObsidian