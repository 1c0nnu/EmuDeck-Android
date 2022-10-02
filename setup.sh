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
EMUDECKGIT="$HOME/EmuDeck/backend"
if [ ! -d "$EMUDECKGIT" ]; then	
	setupTermux
fi
#
#Clone Files
#
if [ -d "$EMUDECKGIT" ]; then
	cd $EMUDECKGIT && git checkout beta && git pull && cd $HOME
else
	git clone https://github.com/EmuDeck/EmuDeck-Android.git "$EMUDECKGIT" && cd $EMUDECKGIT && git checkout beta
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
FOLDER="$HOME/EmuDeck/"
if [ -d "$FOLDER" ]; then
	echo "" > "$HOME/EmuDeck/.finished"
fi
FILE="$HOME/EmuDeck/.finished"
if [ -f $FILE ]; then
	second=true
else
	second=false	
fi




echo "Setup Settings File: "
createUpdateSettingsFile	


#
# UI Start
#



# Welcome, Quick or custom?
source "$EMUDECKGIT"/pages/WelcomePage.sh

if [ $expert == 'false' ]; then 
	cp "$EMUDECKGIT/settings.sh" "$emuDecksettingsFile"
fi

# Device? # Android 11?
source "$EMUDECKGIT"/pages/DeviceSelectorPage.sh

# Location
source "$EMUDECKGIT"/pages/RomStoragePage.sh

#
## Custom mode Questions
#

if [ $expert == 'true' ]; then 
	
	# Emulators	
	source $EMUDECKGIT/pages/EmulatorSelectorPage.sh
 
	# if [ $second == true ]; then
	# 	# Overwrite configuration?		
	# 	source "$EMUDECKGIT"/pages/EmulatorConfigurationPage.sh
	# fi
	
	# Retroachievements
	#source "$EMUDECKGIT"/pages/RAAchievementsPage.sh
	
	# Bezels
	source "$EMUDECKGIT"/pages/RABezelsPage.sh

	#  if [ $deviceAR != 43 ]; then 
	# 	 # AR Sega Classic
	 	source "$EMUDECKGIT"/pages/AspectRatioSegaPage.sh
	# 	
	# 	 # AR SNES + NES
	 	 source "$EMUDECKGIT"/pages/AspectRatioSNESPage.sh
	# 	 
	# 	# AR 3D Classics
	# 	source "$EMUDECKGIT"/pages/AspectRatio3DPage.sh
	# 	
	# 	# AR Gamecube
	# 	source "$EMUDECKGIT"/pages/AspectRatioDolphinPage.sh
	# fi 
	
	# LCD Shader Handhelds
	#source "$EMUDECKGIT"/pages/ShadersHandheldsPage.sh
	
	# CRT Shader Handhelds
	#source "$EMUDECKGIT"/pages/Shaders2DPage.sh
	
	# Frontend
	source "$EMUDECKGIT"/pages/PegasusInstallPage.sh
	
	# Pegasus Theme
	if [ $doInstallPegasus == true ]; then
		source "$EMUDECKGIT"/pages/PegasusThemePage.sh
	fi

fi


#Default Emus per system on Easy mode
if [ $expert == false ]; then 
	setEmusByDefaultOnEasy
fi
# Installation...

#Folder creation	
if [ $android -lt 11 ]; then
	mkdir -p $emulationPath
	mkdir -p $romsPath
	#mkdir -p $toolsPath
	#mkdir -p $savesPath
	#mkdir -p $storagePath
	rsync -ravhp --info=progress2 "$EMUDECKGIT/roms/" "$romsPath/"
else
	#We are forced to install everything on the shared volume since A>11 won't allow Termux to write anywhere else
	mkdir -p $HOME/storage/shared/Emulation
	mkdir -p $HOME/storage/shared/Emulation/roms
	#mkdir -p $HOME/storage/shared/Emulation/tools
	#mkdir -p $HOME/storage/shared/Emulation/saves			
	rsync -ravhp --info=progress2 "$EMUDECKGIT/roms/" "$HOME"/storage/shared/Emulation/roms
fi
 


#Already installed emulators?
checkEmus


#Setting up emulators	
if [ $doSetupRA == true ]; then
	RetroArch_init
fi
# if [ $doSetupDolphin == true ]; then
# 	Dolphin_init
# fi
# if [ $doSetupPCSX2 == true ]; then
# 	Pcsx2_init
# fi
# if [ $doSetupCitra == true ]; then
# 	Citra_init
# fi
# if [ $doSetupDuck == true ]; then
# 	Duckstation_init
# fi
# if [ $doSetupPPSSPP == true ]; then
# 	PPSSPP_init
# fi
# if [ $doSetupSkyline == true ]; then
# 	Skyline_init
# fi
# if [ $doSetupDrastic == true ]; then
# 	echo ""
# fi

#Emulators installation
if [ $doInstallRA == true ] && [  $hasRA == false  ]; then
	RetroArch_install
	clear
	echo -e  "Press the ${RED}A button${NONE} to install the next emulator"
	read pause

fi
if [ $doInstallDolphin == true ] && [  $hasDolphin == false  ]; then
	Dolphin_install
	clear
	echo -e  "Press the ${RED}A button${NONE} to install the next emulator"
	read pause

fi
if [ $doInstallPCSX2 == true ] && [  $hasPCSX2 == false  ]; then
	Pcsx2_install
	clear
	echo -e  "Press the ${RED}A button${NONE} to install the next emulator"
	read pause

fi
if [ $doInstallCitra == true ] && [  $hasCitra == false  ]; then
	Citra_install
	clear
	echo -e  "Press the ${RED}A button${NONE} to install the next emulator"
	read pause

fi
if [ $doInstallDuck == true ] && [  $hasDuck == false  ]; then
	Duckstation_install
	clear
	echo -e  "Press the ${RED}A button${NONE} to install the next emulator"
	read pause

fi
if [ $doInstallPPSSPP == true ] && [  $hasPPSSPP == false  ]; then
	PPSSPP_install
	clear
	echo -e  "Press the ${RED}A button${NONE} to install the next emulator"
	read pause

fi
if [ $doInstallSkyline == true ] && [  $hasSkyline == false  ]; then
	Skyline_install
	clear
	echo -e  "Press the ${RED}A button${NONE} to continue"
	read pause

fi
if [ $doInstallDrastic == true ] && [  $hasDrastic == false  ]; then
	Drastic_install
	clear
	echo -e  "Press the ${RED}A button${NONE} to continue"
	read pause
fi
if [ $doInstallYaba == true ] && [  $hasYaba == false  ]; then
	Yaba_install
	clear
	echo -e  "Press the ${RED}A button${NONE} to continue"
	read pause
fi
if [ $doInstallMupen == true ] && [  $hasMupen == false  ]; then
	Mupen_install
	clear
	echo -e  "Press the ${RED}A button${NONE} to continue"
	read pause

fi
if [ $doInstallRedDream == true ] && [  $hasRedDream == false  ]; then
	RedDream_install
	clear
	echo -e  "Press the ${RED}A button${NONE} to continue"
	read pause

fi

#Configuring emulators

# Retroachievements
# RA Bezels
# AR Sega
# AR SNES+NES# AR 3D Classics		
# AR Gamecube		
# LCD Shader Handhelds		
# CRT Shader Handhelds



if [ $deviceAR != 43 ]; then
	#Bezels
	RetroArch_setBezels
	#New Aspect Ratios
	
	
	#Sega Games
		#Master System
		#Genesis
		#Sega CD
		#Sega 32X
	
	RetroArch_setARSega
	
	#Snes and NES
	RetroArch_setARNintendo
	
	
	# Classic 3D Games
		#Dreamcast
		#PSX
		#Nintendo 64
		#Saturn
		#Xbox
	if [ "$arClassic3D" == 169 ]; then		
		RetroArch_Beetle_PSX_HW_wideScreenOn
		DuckStation_wideScreenOn
		RetroArch_Flycast_wideScreenOn
		Xemu_wideScreenOn
		#"Bezels off"
		RetroArch_Flycast_bezelOff
		RetroArch_Beetle_PSX_HW_bezelOff
		RetroArch_n64_wideScreenOn
		RetroArch_SwanStation_wideScreenOn
	else
		#"SET 4:3"
		RetroArch_Flycast_wideScreenOff
		RetroArch_n64_wideScreenOff
		RetroArch_Beetle_PSX_HW_wideScreenOff
		RetroArch_SwanStation_wideScreenOff
		
		DuckStation_wideScreenOff
		Xemu_wideScreenOff
		#"Bezels on"
		if [ "$RABezels" == true ]; then	
			RetroArch_Flycast_bezelOn			
			RetroArch_n64_bezelOn
			RetroArch_psx_bezelOn
		fi			
	fi
	
	# GameCube
	if [ "$arDolphin" == 169 ]; then	
		Dolphin_wideScreenOn
	else
		Dolphin_wideScreenOff
	fi
	
fi


#
#New Shaders
#	
#RetroArch_setShadersCRT
#RetroArch_setShadersMAT

#AR corrections
RetroArch_169

#Downloading Frontends

if [ $doInstallPegasus == true ]; then
	Pegasus_install
	clear
	echo -e  "Press the ${RED}A button${NONE} to install Pegasus Themes"
	read pause
	
	echo -e "Downloading Pegasus Theme : RP Epic Noir..."
	git clone https://github.com/dragoonDorise/RP-epic-noir.git ~/storage/shared/pegasus-frontend/themes/RP-epic-noir
	cd ~/storage/shared/pegasus-frontend/themes/RP-epic-noir && git pull
	echo -e "${GREEN}OK${NONE}"
	
	echo -e "Downloading Pegasus Theme : RP Switch..."
	#We delete the theme, for previous users	
	git clone https://github.com/dragoonDorise/RP-switch.git ~/storage/shared/pegasus-frontend/themes/RP-switch
	cd ~/storage/shared/pegasus-frontend/themes/RP-switch && git pull
	echo -e "${GREEN}OK${NONE}"
	
	echo -ne "Downloading Pegasus Theme : Retro Mega..."
	git clone https://github.com/plaidman/retromega-next.git ~/storage/shared/pegasus-frontend/themes/retromega
	cd ~/storage/shared/pegasus-frontend/themes/retromega && git pull
	echo -e "${GREEN}OK${NONE}"
	
	if [ $deviceAR != 43 ]; then 
		echo -ne "Downloading Pegasus Theme : GameOS..."
		git clone https://github.com/PlayingKarrde/gameOS.git ~/storage/shared/pegasus-frontend/themes/gameOS
		cd ~/storage/shared/pegasus-frontend/themes/gameOS && git pull
		echo -e "${GREEN}OK${NONE}"
	
		echo -ne "Downloading Pegasus Theme : NeoRetro Dark..."
		git clone https://github.com/TigraTT-Driver/neoretro-dark.git ~/storage/shared/pegasus-frontend/themes/neoretro-dark
		cd ~/storage/shared/pegasus-frontend/themes/neoretro-dark && git pull
		echo -e "${GREEN}OK${NONE}"
	fi
	
fi
if [ $doInstallDaijisho == true ]; then
	Daijishou_install
	clear
	echo -e  "Press the ${RED}A button${NONE} to continue"
	read pause
fi
if [ $doInstallDig == true ]; then
	Dig_install
	clear
	echo -e  "Press the ${RED}A button${NONE} to continue"
	read pause
fi
if [ $doInstallLaunchbox == true ]; then
	Launchbox_install
	clear
	echo -e  "Press the ${RED}A button${NONE} to continue"
	read pause
fi
if [ $doInstallReset == true ]; then
	ResetCollection_install
	clear
	echo -e  "Press the ${RED}A button${NONE} to continue"
	read pause
fi
if [ $doInstallArc == true ]; then
	Arc_install
	clear
	echo -e  "Press the ${RED}A button${NONE} to continue"
	read pause
fi

#RA64 fixes - TO DO. Support only RA64?
echo -e  "Applying ${CYAN}RetroArch 64${NONE} fixes..."
find $romsPath -type f -name "*.txt" -exec sed -i -e 's/com.retroarch\//com.retroarch.aarch64\//g' {} \;
find $romsPath -type f -name "*.txt" -exec sed -i -e 's/-e DATADIR \/data\/data\/com.retroarch/-e DATADIR \/data\/data\/com.retroarch.aarch64/g' {} \;	
find $romsPath -type f -name "*.txt" -exec sed -i -e 's/.browser.retroactivity/com.retroarch.browser.retroactivity/g' {} \;	
find $romsPath -type f -name "*.txt" -exec sed -i -e 's/com.retroarch-1/com.retroarch.aarch64-1/g' {} \;	


# Android 11 instructions



#APK cleanup
rm -rf $HOME/*.apk

echo "" > "$HOME/EmuDeck/.finished"
echo "cd $HOME/EmuDeck/backend/ && git pull && /bin/bash $HOME/EmuDeck/backend/startup.sh" > ~/.bashrc
# source "$EMUDECKGIT"/pages/EndPage.sh"

# Bye bye screen
source "$EMUDECKGIT"/pages/EndPage.sh

am startservice -a com.termux.service_stop com.termux/.app.TermuxService &> /dev/null

# source "$EMUDECKGIT"/pages/UpdateEmusPage.sh"
# source "$EMUDECKGIT"/pages/UninstallPage.sh"
# source "$EMUDECKGIT"/pages/ToolsAndStuffPage.sh"
# source "$EMUDECKGIT"/pages/SettingsPage.sh"
# source "$EMUDECKGIT"/pages/ResetPage.sh"
# source "$EMUDECKGIT"/pages/CheckBiosPage.sh"