 #!/bin/bash
################################################
echo "---------------------------------------"
echo -e "\033[32mFormatting drives...\e[0m"
echo "---------------------------------------"
echo -e "\033[33menter device for ROOT (probably sda2)\e[0m"
    read DEV
    mkfs.ext4 /dev/$DEV
    mount /dev/$DEV /mnt
echo -e "\033[33menter device for BOOT (probably sda1)\e[0m"
    read DEV
    mkfs.vfat -F32 /dev/$DEV
    mkdir -p /mnt/boot
    mount /dev/$DEV /mnt/boot
echo "---------------------------------------"
echo -e "\033[32mInstalling base system...\e[0m"
echo "---------------------------------------"
export LANG=de_CH.UTF-8
pacstrap /mnt base base-devel
echo "---------------------------------------"
echo -e "\033[32mGenerating fstab...\e[0m"
echo "---------------------------------------"
genfstab -U /mnt >> /mnt/etc/fstab
# nano /mnt/etc/fstab
echo "---------------------------------------"
echo -e "\033[32mGoing into arch chroot...\e[0m"
echo "---------------------------------------"
arch-chroot /mnt
################################################