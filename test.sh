#!/bin/bash
#Colors
NONE='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'
BOLD='\033[1m'
UNDERLINE='\033[4m'
BLINK='\x1b[5m'

#
#Setup Termux
#
clear
setupTermux(){
	export DEBIAN_FRONTEND=noninteractive
	apt-get update && 
		apt-get -o "Dpkg::Options::=--force-confold"  upgrade -q -y --force-yes &&
		apt-get -o "Dpkg::Options::=--force-confold"  dist-upgrade -q -y --force-yes
	pkg autoclean
	pkg update -y && pkg upgrade -y
	pkg install git wget jq rsync unzip whiptail binutils build-essential liblz4 libuv ninja -y
	
	FOLDER=~/storage
	if [ ! -d "$FOLDER" ]; then	
		termux-setup-storage
	fi
	
}

#setupTermux


#
#Clone Files
#
EMUDECKGIT="$HOME/EmuDeck/backend"
if [ -d "$EMUDECKGIT" ]; then
	cd $EMUDECKGIT && git checkout beta && git pull && cd $HOME
else
	git clone https://github.com/EmuDeck/EmuDeck-Android.git "$EMUDECKGIT"
	git checkout beta
fi

if [ ! -d "$EMUDECKGIT" ]; then

	echo "### Termux Mirrors seems to be down"  &>> ~/storage/shared/emudeck.log
	echo -e "${RED}ERROR${NONE}"
	echo -e "It seems Termux repositories are down. Let's fix it"
	echo -e "When you press the ${RED}A button${NONE} selector will open. In the first screen ${BOLD}select all three options with the ${GREEN}Y button${NONE} and then Accept using the ${RED}A button${NONE}${NONE}"
	echo -e "Then in the next screen select the first option and press the ${RED}A button${NONE}"
	read pause
	termux-change-repo
	setup_termux
fi


source "$EMUDECKGIT"/functions/all.sh

#
#Log file
#
mkdir -p "$HOME/storage/shared/emudeck/"
LOGFILE="$HOME/storage/shared/emudeck/emudeck.log"
mv "${LOGFILE}" "$HOME/storage/shared/emudeck/emudeck.last.log"

echo "${@}" > "${LOGFILE}" #might as well log out the parameters of the run
exec > >(tee "${LOGFILE}") 2>&1
date "+%Y.%m.%d-%H:%M:%S %Z"



#Mark if this not a fresh install
#FOLDER="$HOME/EmuDeck/"
#if [ -d "$FOLDER" ]; then
#	echo "" > "$HOME/EmuDeck/.finished"
#fi
#SECONDTIME="$HOME/EmuDeck/.finished"





echo "Setup Settings File: "
createUpdateSettingsFile	


#
# UI Start
#
EMUDECKGIT='/media/psf/EmuDeck-Android/'
deviceAR=169;
	 
Dolphin_install


