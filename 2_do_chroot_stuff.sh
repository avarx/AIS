#!/bin/bash
################################################
VCONSOLE="/etc/vconsole.conf"
HOSTNAME="/etc/hostname"
ARCHCONF="boot/loader/entries/arch.conf"
LOADER="/boot/loader/loader.conf"

echo "---------------------------------------"
echo -e "\033[32mGenerating language stuff...\e[0m"
echo "---------------------------------------"
locale-gen
echo LANG=de_CH.UTF-8 > /etc/locale.conf
export LANG=de_CH.UTF-8
echo "de_CH-latin1" > $VCONSOLE
ln -s /usr/share/zoneinfo/Europe/Zurich /etc/localtime
hwclock --systohc --utc
echo "archy" > $HOSTNAME
pacman -S dhcpcd
systemctl enable dhcpcd
echo "---------------------------------------"
echo -e "\033[32mDoing boot stuff...\e[0m"
echo "---------------------------------------"
pacman -S dosfstools
bootctl --path=/boot install
touch boot/loader/entries/arch.conf
echo "title Arch Linux" >> $ARCHCONF
echo "linux /vmlinuz-linux" >> $ARCHCONF
echo "initrd /initramfs-linux.img" >> $ARCHCONF
echo "options root=/dev/sda2 rw elevator=deadline quiet splash resume=/dev/sda1 nmi_watchdog=0" >> $ARCHCONF

echo "default arch" > $LOADER
echo "---------------------------------------"
echo -e "\033[33mNow Check fstab!\e[0m"
echo -e "\033[33mIf fstab is ok; set a password for root with passwd.\e[0m"
echo -e "\033[33mWhen done, do exit, reboot and remove the stick.\e[0m"
echo "---------------------------------------"
################################################