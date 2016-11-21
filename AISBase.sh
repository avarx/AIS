#!/bin/bash
################################################
echo "---------------------------------------"
echo -e "\033[32mFormatting drives...\e[0m"
echo "---------------------------------------"
echo -e "\033[33menter device for ROOT (probably sda2)\e[0m"
    read DEV
    cryptsetup --cipher aes-xts-plain64 --key-size 512 --hash sha512 --iter-time 4000 luksFormat /dev/$DEV
    cryptsetup open --type luks /dev/$DEV lvm

    pvcreate /dev/mapper/lvm
    vgcreate vol0 /dev/mapper/lvm
    # Adjust swap size according to your system needs.
    lvcreate --name lv_swap -L 16GB vol0
    lvcreate --name lv_root -L 85GB vol0
    lvcreate --name lv_home -l 100%FREE vol0
    # format root and home
    mkfs.ext4 /dev/mapper/vol0-lv_root
    mkfs.ext4 /dev/mapper/vol0-lv_home
    # mount root
    mkdir /mnt
    mount /dev/mapper/vol0-lv_root /mnt
    # Mount the home drive
    mkdir /mnt/home
    mount /dev/mapper/vol0-lv_home /mnt/home
    # create swap
    mkswap /dev/mapper/vol0-lv_swap
    swapon /dev/mapper/vol0-lv_swap

echo -e "\033[33menter device for BOOT (probably sda1)\e[0m"
    read DEV
    mkfs.vfat -F32 /dev/$DEV
    mkdir -p /mnt/boot
    mount /dev/$DEV /mnt/boot
echo "---------------------------------------"
echo -e "\033[32mInstalling base system...\e[0m"
echo "---------------------------------------"
export LANG=en_US.UTF-8
pacstrap /mnt base base-devel
echo "---------------------------------------"
echo -e "\033[32mGenerating fstab...\e[0m"
echo "---------------------------------------"
genfstab -U -p /mnt >> /mnt/etc/fstab
# nano /mnt/etc/fstab
echo "---------------------------------------"
echo -e "\033[32mGoing into arch chroot...\e[0m"
echo "---------------------------------------"
arch-chroot /mnt
################################################
