#!/bin/bash
################################################
XINITRC=".xinitrc"
echo "---------------------------------------"
echo -e "\033[32mInstaling X, awesomeWM and starting it...\e[0m"
echo "---------------------------------------"
sudo pacman -S xorg
sudo pacman -S awesome
sudo pacman -S xorg-xinit
touch .xinitrc
echo "exec awesome" > $XINITRC
startx
################################################