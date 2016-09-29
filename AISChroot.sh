uthor avarx
# Contributor calesanz
# 
# Helping Guide http://www.brandonkester.com/tech/2014/03/16/full-disk-encryption-in-arch-linux-with-uefi.html
#
#
################################################
VCONSOLE="/etc/vconsole.conf"
HOSTNAME="/etc/hostname"
ARCHCONF="boot/loader/entries/arch.conf"
LOADER="/boot/loader/loader.conf"
MKINITCPIOCONF="/etc/mkinitcpio.conf"
TEMP="/tmp/mkinit.tmp"

echo "---------------------------------------"
echo -e "\033[32mGenerating language stuff...\e[0m"
echo "---------------------------------------"
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo "KEYMAP=de_CH-latin1" > $VCONSOLE
ln -s /usr/share/zoneinfo/Europe/Zurich /etc/localtime
hwclock --systohc --utc
echo "archy" > $HOSTNAME
pacman -S dhcpcd
systemctl enable dhcpcd
echo "---------------------------------------"
echo -e "\033[32mDoing boot stuff...\e[0m"
echo "---------------------------------------"
echo -e "\033[33menter device for ROOT (probably sda2)\e[0m"
read DEV
pacman -S dosfstools
# bootctl
bootctl --path=/boot install

# archconf
echo -e "\033[32mBoot configuration...\e[0m"
touch boot/loader/entries/arch.conf
UUID=$(blkid /dev/$DEV | awk '{print $2}' | sed 's/"//g') 
echo "title Arch Linux" >> $ARCHCONF
echo "linux /vmlinuz-linux" >> $ARCHCONF
echo "initrd /initramfs-linux.img" >> $ARCHCONF
echo "options cryptdevice=$UUID:lvm:allow-discards resume=/dev/mapper/vol0-lv_swap root=/dev/mapper/vol0-lv_root rw quiet splash elevator=deadline" >> $ARCHCONF
echo "default arch" > $LOADER
echo "bootctl update..."
bootctl update
echo "remove hooks mkinitcpioconf..."
sed  s/^HOOKS=.*$// $MKINITCPIOCONF > $TEMP && mv $TEMP $MKINITCPIOCONF && rm -f $TEMP
echo "add hooks"
echo "HOOKS=\"base udev autodetect modconf block keyboard keymap encrypt lvm2 resume filesystems fsck\"" >> $MKINITCPIOCONF

# regenerate ramdisk
echo "mkinitcpio..."
mkinitcpio -p linux

echo "---------------------------------------"
echo -e "\033[33mNow Check fstab!\e[0m"
echo -e "\033[33mIf fstab is ok; set a password for root with passwd.\e[0m"
echo -e "\033[33mWhen done, do exit, reboot and remove the stick.\e[0m"
echo "---------------------------------------"
################################################
