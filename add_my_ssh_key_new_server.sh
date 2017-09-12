#!/bin/sh

#######################################
# Bash script to install my public SSH Key onto Ubuntu based systems.
# Written by TheFreelancer
#######################################

#COLORS
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan

#
# UPDATE AND UPGRADE SYSTEM BEFORE INSTALLATION
#
echo "$Cyan \n Updating System.. $Color_Off"
apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y
apt-get install -y \
		htop \
		iotop \
		iftop \
    screen \
    aptitude \
    zip \
    git \
    mtr \
    traceroute \
    nano 
echo "$Green \n System Updated $Color_Off"

#
# SSH Key
#
echo "$Cyan \n Adding SSH Key to authorized_keys $Color_Off"
TARGET_URL="https://raw.githubusercontent.com/ben47955/SSH-Keys/master/ben47955.pub" # Location of SSH Key in a website directory - Key Must be a Raw Text File
TARGET_DIR="/root/.ssh"
TARGET_FILE="$TARGET_DIR/authorized_keys"
rm -rf $TARGET_DIR
mkdir $TARGET_DIR
touch $TARGET_FILE
wget -qO- $TARGET_URL >> $TARGET_FILE
printf "\n" >> $TARGET_FILE 
echo "$Green \n Key has been added $Color_Off"

#
# SCRIPT FINISHED
#
echo "$Green \n\n Script Finished $Color_Off"
echo PermitRootLogin without-password
echo systemctl restart sshd
echo nano /etc/ssh/sshd_config

