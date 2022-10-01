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

# Welcome, Quick or custom?
source "$EMUDECKGIT"/pages/WelcomePage.sh

# Device? # Android 11?
source "$EMUDECKGIT"/pages/DeviceSelectorPage.sh

# Location
#source "$EMUDECKGIT"/pages/RomStoragePage.sh

#
## Custom mode Questions
#

exit

if [ $expert == 'true' ]; then 
	
	# Emulators	
	source $EMUDECKGIT/pages/EmulatorSelectorPage.sh
 
 	# Overwrite configuration?
 	source "$EMUDECKGIT"/pages/EmulatorConfigurationPage.sh
 	
 	# Retroachievements
 	source "$EMUDECKGIT"/pages/RAAchievementsPage.sh
 	
 	# Bezels
 	source "$EMUDECKGIT"/pages/RABezelsPage.sh
 
 	# AR Sega Classic
	source "$EMUDECKGIT"/pages/AspectRatioSegaPage.sh
	
 	# AR SNES + NES
 	source "$EMUDECKGIT"/pages/AspectRatioSNESPage.sh
 	
	# AR 3D Classics
	source "$EMUDECKGIT"/pages/AspectRatio3DPage.sh
	
	# AR Gamecube
	source "$EMUDECKGIT"/pages/AspectRatioDolphinPage.sh
	
	# LCD Shader Handhelds
	source "$EMUDECKGIT"/pages/ShadersHandheldsPage.sh
	
	# CRT Shader Handhelds
	source "$EMUDECKGIT"/pages/Shaders2DPage.sh
	
	# Frontend
	source "$EMUDECKGIT"/pages/PegasusInstallPage.sh
	
	# Pegasus Theme
	
	if [ $doInstallPegasus == true ]; then
		source "$EMUDECKGIT"/pages/PegasusThemePage.sh
	fi

fi
exit
#Default Emus per system on Easy mode
if [ $expert == false ]; then 
	setEmusByDefaultOnEasy
fi
# Installation...

	#Already installed emulators?
	checkEmus

	#Emulators installation
	if [ $doInstallRA == true ] && [  $hasRA == false  ]; then
		echo ""
	fi
	if [ $doInstallDolphin == true ] && [  $hasDolphin == false  ]; then
		Dolphin_install
	fi
	if [ $doInstallPCSX2 == true ] && [  $hasPCSX2 == false  ]; then
		echo ""
	fi
	if [ $doInstallCitra == true ] && [  $hasCitra == false  ]; then
		echo ""
	fi
	if [ $doInstallDuck == true ] && [  $hasDuck == false  ]; then
		echo ""
	fi
	if [ $doInstallPPSSPP == true ] && [  $hasPPSSPP == false  ]; then
		echo ""
	fi
	if [ $doInstallSkyline == true ] && [  $hasSkyline == false  ]; then
		echo ""
	fi
	if [ $doInstallDrastic == true ] && [  $hasDrastic == false  ]; then
		echo ""
	fi


	#Setting up emulators	
	if [ $doSetupRA == true ]; then
		echo ""
	fi
	if [ $doSetupDolphin == true ]; then
		echo ""
	fi
	if [ $doSetupPCSX2 == true ]; then
		echo ""
	fi
	if [ $doSetupCitra == true ]; then
		echo ""
	fi
	if [ $doSetupDuck == true ]; then
		echo ""
	fi
	if [ $doSetupPPSSPP == true ]; then
		echo ""
	fi
	if [ $doSetupSkyline == true ]; then
		echo ""
	fi
	if [ $doSetupDrastic == true ]; then
		echo ""
	fi

	#Configuring emulators
	
		# Retroachievements
		# RA Bezels

		# AR Sega
		# AR SNES+NES# AR 3D Classics		
		# AR Gamecube		
		# LCD Shader Handhelds		
		# CRT Shader Handhelds
			

# Android 11 instructions

# Bye bye screen
echo "" > "$HOME/EmuDeck/.finished"

# source "$EMUDECKGIT"/pages/EndPage.sh"



# source "$EMUDECKGIT"/pages/UpdateEmusPage.sh"
# source "$EMUDECKGIT"/pages/UninstallPage.sh"
# source "$EMUDECKGIT"/pages/ToolsAndStuffPage.sh"
# source "$EMUDECKGIT"/pages/SettingsPage.sh"
# source "$EMUDECKGIT"/pages/ResetPage.sh"
# source "$EMUDECKGIT"/pages/CheckBiosPage.sh"