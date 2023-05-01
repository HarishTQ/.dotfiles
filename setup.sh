#!/bin/sh

# Helper Functions

update() { sudo dnf update && sudo dnf upgrade; }
Install(){ sudo dnf install "$1"; }

installEssentials(){
	Install curl;
	Install wget;
	Install git;
	Install gnome-tweaks;
	Install vlc;
	Install stacer;
	Install stow;
	Install timeshift;
}

installChrome(){
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm;
	Install ./google-chrome-stable_current_x86_64.rpm
}

installVScode(){
	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
	sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
	dnf check-update
	Install code
}

installSpotify(){
	flatpak install flathub com.spotify.Client
}

setupFlatpak(){
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	flatpak install flathub com.github.tchx84.Flatseal
}

installGithubDesktop(){
	flatpak install flathub io.github.shiftey.Desktop
}

installAlacritty(){
	update;
	sudo add-apt-repository ppa:aslatter/ppa -y;
	Install alacritty;
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

installGrapeJuice(){
	flatpak install flathub net.brinkervii.grapejuice
}

installLunaClient(){
	flatpak install flathub com.lunarclient.LunarClient
}

#update
#installEssentials
#setupFlatpak
#installChrome
#installVScode
#installSpotify
#installGithubDesktop
#installAlacritty
#installDiscord
#installExtensionManager
#installBrave
#removeSnap
#installObsidian
#installGrapeJuice
installLunaClient
