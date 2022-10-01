#!/bin/bash

#variables
Duckstation_emuName="Duckstation"
Duckstation_emuType="store"
Duckstation_emuPath="$HOME/Android/data/xyz.aethersx2.android/files"
Duckstation_releaseURL=""

Duckstation_cleanup(){
 echo "NYI"
}

#Install
Duckstation_install(){
	setMSG "${Duckstation_emuName}: Install"
	setMSG "Installing ${Duckstation_emuName}"			
	termux-open "https://play.google.com/store/apps/details?id=com.github.stenzek.duckstation"
	#Duckstation_init
}

#ApplyInitialSettings
Duckstation_init(){
	setMSG "${Duckstation_emuName}: Apply initial config"
	echo ""
	configEmuFP "${Duckstation_emuName}" "${Duckstation_emuPath}" "true"
	# Duckstation_setupStorage
	#Duckstation_setEmulationFolder
	# Duckstation_setupSaves
}

#update
Duckstation_update(){
	setMSG "${Duckstation_emuName}: Apply configuration Update"
	echo ""
	configEmuFP "${Duckstation_emuName}" "${Duckstation_emuPath}"
	# Duckstation_setupStorage
	# Duckstation_setEmulationFolder
	# Duckstation_setupSaves
}

#ConfigurePaths
Duckstation_setEmulationFolder(){
	setMSG "${Duckstation_emuName}: Configure Emulation folder"
	echo ""
	configFile="$HOME/storage/shared/Duckstation-mmjr/Config/Duckstation.ini"
	gameDirOpt1='ISOPath0 = '
	gameDirOpt1Setting='ISOPath0 = '"${romsPath}/gc"
	gameDirOpt2='ISOPath1 = '
	gameDirOpt2Setting='ISOPath1 = '"${romsPath}/wii"
	sed -i "/${gameDirOpt1}/c\\${gameDirOpt1Setting}" "$configFile"
	sed -i "/${gameDirOpt2}/c\\${gameDirOpt2Setting}" "$configFile"
}

#SetupSaves
Duckstation_setupSaves(){
	setMSG "${Duckstation_emuName}: setup Saves folder"
	# echo ""
	# linkToSaveFolder Duckstation GC "$HOME/.var/app/org.DuckstationEmu.Duckstation-emu/data/Duckstation-emu/GC"
	# linkToSaveFolder Duckstation Wii "$HOME/.var/app/org.DuckstationEmu.Duckstation-emu/data/Duckstation-emu/Wii"
	# linkToSaveFolder Duckstation states "$HOME/.var/app/org.DuckstationEmu.Duckstation-emu/data/Duckstation-emu/states"
}


#SetupStorage
Duckstation_setupStorage(){
	echo "NYI"#TBD
}


#WipeSettings
Duckstation_wipe(){
   #rm -rf "$HOME/.var/app/$Duckstation_emuPath"
   echo "NYI" 
   # prob not cause roms are here
}


#Uninstall
Duckstation_uninstall(){
	echo "NYI" 
	#flatpak uninstall "$Duckstation_emuPath" --user -y
}

#setABXYstyle
Duckstation_setABXYstyle(){
	   echo "NYI" 
}

#Migrate
Duckstation_migrate(){
		echo "NYI"
}

#WideScreenOn
Duckstation_wideScreenOn(){
	setMSG "${Duckstation_emuName}: Widescreen On"
	echo ""
	configFile="$HOME/storage/shared/Duckstation-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = True'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 1'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#WideScreenOff
Duckstation_wideScreenOff(){
	setMSG "${Duckstation_emuName}: Widescreen Off"
	echo ""
	configFile="$HOME/storage/shared/Duckstation-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = False'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 0'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#BezelOn
Duckstation_bezelOn(){
echo "NYI"
}

#BezelOff
Duckstation_bezelOff(){
echo "NYI"
}

#finalExec - Extra stuff
Duckstation_finalize(){
	echo "NYI"
}

