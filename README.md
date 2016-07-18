# AIS
Arch Installation Scripts

# Description
**Really** basic scripts to aid in installing Arch Linux.


# Usage
## 1 Prepare

1. parted /dev/sda

2. mklabel gpt

3. mkpart ESP fat32 1049kB 538MB

4. set 1 boot on

5. mkpart primary ext4 538MB 100%

6. quit

## 2 Base System
1. <code>wget URL<code>
2. <code>sh 1_install_base_system.sh<code>
3. Follow instructions

## 3 Do chroot stuff
1. <code>wget URL<code>
2. <code>sh 2_do_chroot_stuff.sh<code>
3. Follow instructions

## 4 Create user
1. <code>wget URL<code>
2. <code>sh 3_create_user.sh<code>
3. Follow instructions

## 5 Install WM
1. <code>wget URL<code>
2. <code>sh 4_install_wm.sh<code>
3. Follow instructions

## 6 Install packages
1. <code>wget URL<code>
2. <code>sh 5_install_packages.sh<code>
3. Follow instructions

