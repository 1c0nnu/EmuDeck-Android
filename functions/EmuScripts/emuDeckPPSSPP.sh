#!/bin/bash

#variables
PPSSPP_emuName="PPSSPP"
PPSSPP_emuType="store"
PPSSPP_emuPath="$HOME/Android/data/xyz.aethersx2.android/files"
PPSSPP_releaseURL=""

PPSSPP_cleanup(){
 echo "NYI"
}

#Install
PPSSPP_install(){
	setMSG "${PPSSPP_emuName}: Install"
	setMSG "Installing ${PPSSPP_emuName}"			
	termux-open "https://play.google.com/store/apps/details?id=org.ppsspp.ppsspp"
	#PPSSPP_init
}

#ApplyInitialSettings
PPSSPP_init(){
	setMSG "${PPSSPP_emuName}: Apply initial config"
	echo ""
	configEmuFP "${PPSSPP_emuName}" "${PPSSPP_emuPath}" "true"
	# PPSSPP_setupStorage
	#PPSSPP_setEmulationFolder
	# PPSSPP_setupSaves
}

#update
PPSSPP_update(){
	setMSG "${PPSSPP_emuName}: Apply configuration Update"
	echo ""
	configEmuFP "${PPSSPP_emuName}" "${PPSSPP_emuPath}"
	# PPSSPP_setupStorage
	# PPSSPP_setEmulationFolder
	# PPSSPP_setupSaves
}

#ConfigurePaths
PPSSPP_setEmulationFolder(){
	setMSG "${PPSSPP_emuName}: Configure Emulation folder"
	echo ""
	configFile="$HOME/storage/shared/PPSSPP-mmjr/Config/PPSSPP.ini"
	gameDirOpt1='ISOPath0 = '
	gameDirOpt1Setting='ISOPath0 = '"${romsPath}/gc"
	gameDirOpt2='ISOPath1 = '
	gameDirOpt2Setting='ISOPath1 = '"${romsPath}/wii"
	sed -i "/${gameDirOpt1}/c\\${gameDirOpt1Setting}" "$configFile"
	sed -i "/${gameDirOpt2}/c\\${gameDirOpt2Setting}" "$configFile"
}

#SetupSaves
PPSSPP_setupSaves(){
	setMSG "${PPSSPP_emuName}: setup Saves folder"
	# echo ""
	# linkToSaveFolder PPSSPP GC "$HOME/.var/app/org.PPSSPPEmu.PPSSPP-emu/data/PPSSPP-emu/GC"
	# linkToSaveFolder PPSSPP Wii "$HOME/.var/app/org.PPSSPPEmu.PPSSPP-emu/data/PPSSPP-emu/Wii"
	# linkToSaveFolder PPSSPP states "$HOME/.var/app/org.PPSSPPEmu.PPSSPP-emu/data/PPSSPP-emu/states"
}


#SetupStorage
PPSSPP_setupStorage(){
	echo "NYI"#TBD
}


#WipeSettings
PPSSPP_wipe(){
   #rm -rf "$HOME/.var/app/$PPSSPP_emuPath"
   echo "NYI" 
   # prob not cause roms are here
}


#Uninstall
PPSSPP_uninstall(){
	echo "NYI" 
	#flatpak uninstall "$PPSSPP_emuPath" --user -y
}

#setABXYstyle
PPSSPP_setABXYstyle(){
	   echo "NYI" 
}

#Migrate
PPSSPP_migrate(){
		echo "NYI"
}

#WideScreenOn
PPSSPP_wideScreenOn(){
	setMSG "${PPSSPP_emuName}: Widescreen On"
	echo ""
	configFile="$HOME/storage/shared/PPSSPP-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = True'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 1'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#WideScreenOff
PPSSPP_wideScreenOff(){
	setMSG "${PPSSPP_emuName}: Widescreen Off"
	echo ""
	configFile="$HOME/storage/shared/PPSSPP-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = False'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 0'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#BezelOn
PPSSPP_bezelOn(){
echo "NYI"
}

#BezelOff
PPSSPP_bezelOff(){
echo "NYI"
}

#finalExec - Extra stuff
PPSSPP_finalize(){
	echo "NYI"
}

