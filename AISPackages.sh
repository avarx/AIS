#!/bin/bash
################################################
#install packages alphabetically
sudo pacman -S --noconfirm composer &&
sudo pacman -S --noconfirm docker &&
sudo pacman -S --noconfirm fcrackzip &&
sudo pacman -S --noconfirm feh &&
sudo pacman -S --noconfirm filezilla &&
sudo pacman -S --noconfirm firefox &&
sudo pacman -S --noconfirm ghex &&
sudo pacman -S --noconfirm gimp &&
sudo pacman -S --noconfirm git &&
sudo pacman -S --noconfirm htop &&
sudo pacman -S --noconfirm imagemagick &&
sudo pacman -S --noconfirm john &&
sudo pacman -S --noconfirm linux-headers &&
sudo pacman -S --noconfirm ltrace &&
sudo pacman -S --noconfirm mitmproxy &&
sudo pacman -S --noconfirm mpc &&
sudo pacman -S --noconfirm mpd &&
sudo pacman -S --noconfirm mplayer &&
sudo pacman -S --noconfirm mutt &&
sudo pacman -S --noconfirm nano &&
sudo pacman -S --noconfirm net-tools &&
sudo pacman -S --noconfirm netctl &&
sudo pacman -S --noconfirm nikto &&
sudo pacman -S --noconfirm nmap &&
sudo pacman -S --noconfirm openvpn &&
sudo pacman -S --noconfirm ranger &&
sudo pacman -S --noconfirm rsync &&
sudo pacman -S --noconfirm rxvt-unicode &&
sudo pacman -S --noconfirm screen &&
sudo pacman -S --noconfirm sox &&
sudo pacman -S --noconfirm steghide &&
sudo pacman -S --noconfirm strace &&
sudo pacman -S --noconfirm teamspeak3 &&
sudo pacman -S --noconfirm terminus-font &&
sudo pacman -S --noconfirm thunderbird &&
sudo pacman -S --noconfirm tor &&
sudo pacman -S --noconfirm transmission-cli &&
sudo pacman -S --noconfirm vagrant &&
sudo pacman -S --noconfirm veracrypt &&
sudo pacman -S --noconfirm virtualbox &&
sudo pacman -S --noconfirm virtualbox-guest-dkms &&
sudo pacman -S --noconfirm weechat &&
sudo pacman -S --noconfirm wireshark-common &&
sudo pacman -S --noconfirm wireshark-gtk &&
sudo pacman -S --noconfirm xterm &&
sudo pacman -S --noconfirm zaproxy &&
sudo pacman -S --noconfirm zbar &&
sudo pacman -S --noconfirm zsh

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