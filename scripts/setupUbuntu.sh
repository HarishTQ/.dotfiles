# Script to setup Ubuntu

## Install Git and base-devel
sudo apt install base-devel

## Install ZSH
sudo apt install zsh
chsh -s $(which zsh)

echo $SHELL

## Version Printing
zsh --version