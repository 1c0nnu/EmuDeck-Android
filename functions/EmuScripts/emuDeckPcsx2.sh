#!/bin/bash

#variables
Pcsx2_emuName="Pcsx2"
Pcsx2_emuType="store"
Pcsx2_emuPath="$HOME/Android/data/xyz.aethersx2.android/files"
Pcsx2_releaseURL=""


Pcsx2_cleanup(){
 echo "NYI"
}

#Install
Pcsx2_install(){
	setMSG "${Pcsx2_emuName}: Install"
	setMSG "Installing ${Pcsx2_emuName}"			
	termux-open "https://play.google.com/store/apps/details?id=xyz.aethersx2.android"
	#Pcsx2_init
}

#ApplyInitialSettings
Pcsx2_init(){
	setMSG "${Pcsx2_emuName}: Apply initial config"
	echo ""
	configEmuFP "${Pcsx2_emuName}" "${Pcsx2_emuPath}" "true"
	# Pcsx2_setupStorage
	#Pcsx2_setEmulationFolder
	# Pcsx2_setupSaves
}

#update
Pcsx2_update(){
	setMSG "${Pcsx2_emuName}: Apply configuration Update"
	echo ""
	configEmuFP "${Pcsx2_emuName}" "${Pcsx2_emuPath}"
	# Pcsx2_setupStorage
	# Pcsx2_setEmulationFolder
	# Pcsx2_setupSaves
}

#ConfigurePaths
Pcsx2_setEmulationFolder(){
	setMSG "${Pcsx2_emuName}: Configure Emulation folder"
	echo ""
	configFile="$HOME/storage/shared/Pcsx2-mmjr/Config/Pcsx2.ini"
	gameDirOpt1='ISOPath0 = '
	gameDirOpt1Setting='ISOPath0 = '"${romsPath}/gc"
	gameDirOpt2='ISOPath1 = '
	gameDirOpt2Setting='ISOPath1 = '"${romsPath}/wii"
	sed -i "/${gameDirOpt1}/c\\${gameDirOpt1Setting}" "$configFile"
	sed -i "/${gameDirOpt2}/c\\${gameDirOpt2Setting}" "$configFile"
}

#SetupSaves
Pcsx2_setupSaves(){
	setMSG "${Pcsx2_emuName}: setup Saves folder"
	# echo ""
	# linkToSaveFolder Pcsx2 GC "$HOME/.var/app/org.Pcsx2Emu.Pcsx2-emu/data/Pcsx2-emu/GC"
	# linkToSaveFolder Pcsx2 Wii "$HOME/.var/app/org.Pcsx2Emu.Pcsx2-emu/data/Pcsx2-emu/Wii"
	# linkToSaveFolder Pcsx2 states "$HOME/.var/app/org.Pcsx2Emu.Pcsx2-emu/data/Pcsx2-emu/states"
}


#SetupStorage
Pcsx2_setupStorage(){
	echo "NYI"#TBD
}


#WipeSettings
Pcsx2_wipe(){
   #rm -rf "$HOME/.var/app/$Pcsx2_emuPath"
   echo "NYI" 
   # prob not cause roms are here
}


#Uninstall
Pcsx2_uninstall(){
	echo "NYI" 
	#flatpak uninstall "$Pcsx2_emuPath" --user -y
}

#setABXYstyle
Pcsx2_setABXYstyle(){
	   echo "NYI" 
}

#Migrate
Pcsx2_migrate(){
		echo "NYI"
}

#WideScreenOn
Pcsx2_wideScreenOn(){
	setMSG "${Pcsx2_emuName}: Widescreen On"
	echo ""
	configFile="$HOME/storage/shared/Pcsx2-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = True'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 1'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#WideScreenOff
Pcsx2_wideScreenOff(){
	setMSG "${Pcsx2_emuName}: Widescreen Off"
	echo ""
	configFile="$HOME/storage/shared/Pcsx2-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = False'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 0'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#BezelOn
Pcsx2_bezelOn(){
echo "NYI"
}

#BezelOff
Pcsx2_bezelOff(){
echo "NYI"
}

#finalExec - Extra stuff
Pcsx2_finalize(){
	echo "NYI"
}

