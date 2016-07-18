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
1. <code>wget https://avarx.link/AISBase.sh<code>
2. <code>sh AISBase.sh<code>
3. Follow instructions

## 3 Do chroot stuff
1. <code>wget https://avarx.link/AISChroot.sh<code>
2. <code>sh AISChroot.sh<code>
3. Follow instructions

## 4 Create user
1. <code>wget https://avarx.link/AISUser.sh<code>
2. <code>sh AISUser.sh<code>
3. Follow instructions

## 5 Install WM
1. <code>wget https://avarx.link/AISWM.sh<code>
2. <code>sh AISWM.sh<code>
3. Follow instructions

## 6 Install packages
1. <code>wget https://avarx.link/AISPackages.sh<code>
2. <code>sh AISPackages.sh<code>
3. Follow instructions

