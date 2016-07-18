#!/bin/bash
################################################
SUDOERS="/etc/sudoers"
groupadd users
echo "---------------------------------------"
echo -e "\033[33menter a username\e[0m"
    read USERNAME
    echo "---------------------------------------"
    echo -e "\033[32mAdding user...\e[0m"
    echo "---------------------------------------"
    useradd -m -g users -G wheel -s /bin/bash $USERNAME
    pacman -S sudo
    echo "%wheel ALL=(ALL) ALL" > $SUDOERS
    echo "---------------------------------------"
    echo -e "\033[32mSet a password:\e[0m"
    echo "---------------------------------------"
    passwd $USERNAME
    echo "---------------------------------------"
    echo -e "\033[32mNow do a reboot\e[0m"
    echo "---------------------------------------"
################################################
