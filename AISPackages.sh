#!/bin/bash
################################################
#install packages alphabetically
# $ sudo pacman -S $(cat installed_pacman_packages | grep -o "^ *[^#]*" | less)
# Thx to @mindfuckup

composer
docker
fcrackzip
feh
filezilla
firefox
ghex
gimp
git
htop
imagemagick
john
linux-headers
ltrace
mitmproxy
mpc
mpd
mplayer
mutt
nano
net-tools
netctl
nikto
nmap
openvpn
ranger
rsync
rxvt-unicode
screen
sox
steghide
strace
teamspeak3
terminus-font
thunderbird
tor
transmission-cli
vagrant
veracrypt
virtualbox
virtualbox-guest-dkms
weechat
wireshark-common
wireshark-gtk
xterm
zaproxy
zbar
zsh

#yaourt and dependencies
curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz
tar -xvzf package-query.tar.gz
cd package-query
makepkg -si
cd ..
curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz
tar -xvzf yaourt.tar.gz
cd yaourt
makepkg -si