#!/bin/bash

#variables
Dolphin_emuName="dolphin-mmjr"
Dolphin_emuType="apk"
Dolphin_emuPath="$HOME/storage/shared/dolphin-mmjr"
Dolphin_releaseURL=""

#cleanupOlderThings
Dolphin_cleanup(){
 echo "NYI"
}

#Install
Dolphin_install(){
	setMSG "${Dolphin_emuName}: Install"
	local releaseURL="$(getLatestReleaseURLGH "Bankaimaster999/Dolphin-MMJR" "apk")"
	setMSG "Installing ${Dolphin_emuName}"		
	curl -L "$releaseURL" -o "${Dolphin_emuName}.apk"
	xdg-open "${Dolphin_emuName}.apk"	
}

#ApplyInitialSettings
Dolphin_init(){
	setMSG "${Dolphin_emuName}: Apply initial config"
	echo ""
	configEmuFP "${Dolphin_emuName}" "${Dolphin_emuPath}" "true"
	# Dolphin_setupStorage
	Dolphin_setEmulationFolder
	# Dolphin_setupSaves
}

#update
Dolphin_update(){
	setMSG "${Dolphin_emuName}: Apply configuration Update"
	echo ""
	configEmuFP "${Dolphin_emuName}" "${Dolphin_emuPath}"
	# Dolphin_setupStorage
	# Dolphin_setEmulationFolder
	# Dolphin_setupSaves
}

#ConfigurePaths
Dolphin_setEmulationFolder(){
	setMSG "${Dolphin_emuName}: Configure Emulation folder"
	echo ""
	configFile="$HOME/storage/shared/dolphin-mmjr/Config/Dolphin.ini"
	gameDirOpt1='ISOPath0 = '
	gameDirOpt1Setting='ISOPath0 = '"${romsPath}/gc"
	gameDirOpt2='ISOPath1 = '
	gameDirOpt2Setting='ISOPath1 = '"${romsPath}/wii"
	sed -i "/${gameDirOpt1}/c\\${gameDirOpt1Setting}" "$configFile"
	sed -i "/${gameDirOpt2}/c\\${gameDirOpt2Setting}" "$configFile"
}

#SetupSaves
Dolphin_setupSaves(){
	setMSG "${Dolphin_emuName}: setup Saves folder"
	# echo ""
	# linkToSaveFolder dolphin GC "$HOME/.var/app/org.DolphinEmu.dolphin-emu/data/dolphin-emu/GC"
	# linkToSaveFolder dolphin Wii "$HOME/.var/app/org.DolphinEmu.dolphin-emu/data/dolphin-emu/Wii"
	# linkToSaveFolder dolphin states "$HOME/.var/app/org.DolphinEmu.dolphin-emu/data/dolphin-emu/states"
}


#SetupStorage
Dolphin_setupStorage(){
	echo "NYI"#TBD
}


#WipeSettings
Dolphin_wipe(){
   #rm -rf "$HOME/.var/app/$Dolphin_emuPath"
   echo "NYI" 
   # prob not cause roms are here
}


#Uninstall
Dolphin_uninstall(){
	echo "NYI" 
	#flatpak uninstall "$Dolphin_emuPath" --user -y
}

#setABXYstyle
Dolphin_setABXYstyle(){
	   echo "NYI" 
}

#Migrate
Dolphin_migrate(){
		echo "NYI"
}

#WideScreenOn
Dolphin_wideScreenOn(){
	setMSG "${Dolphin_emuName}: Widescreen On"
	echo ""
	configFile="$HOME/storage/shared/dolphin-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = True'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 1'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#WideScreenOff
Dolphin_wideScreenOff(){
	setMSG "${Dolphin_emuName}: Widescreen Off"
	echo ""
	configFile="$HOME/storage/shared/dolphin-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = False'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 0'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#BezelOn
Dolphin_bezelOn(){
echo "NYI"
}

#BezelOff
Dolphin_bezelOff(){
echo "NYI"
}

#finalExec - Extra stuff
Dolphin_finalize(){
	echo "NYI"
}

