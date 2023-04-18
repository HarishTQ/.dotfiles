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
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/BryanDollery/remove-snap/main/remove-snap.sh)"
	sudo apt purge snapd
}

update
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
