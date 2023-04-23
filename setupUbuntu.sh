# Script to setup Ubuntu

sudo apt update && sudo apt upgrade
sudo add-apt-repository universe
sudo apt install ubuntu-restricted-extras
sudo apt update
sudo apt install wget curl

## Install Git and base-devel
sudo apt install base-devel


## Install ZSH
sudo apt install zsh
chsh -s $(which zsh)

## Install FiraCode
sudo apt install fonts-firacode

## Install StarShip Prompt
curl -sS https://starship.rs/install.sh | sh

## Install Alacritty
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty


## Version Printing
git --version

zsh --version
