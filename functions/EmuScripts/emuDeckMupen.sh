#!/bin/bash

#variables
Mupen_emuName="Mupen"
Mupen_emuType="store"
Mupen_emuPath="$HOME/Android/data/org.mupen64plusae.v3.fzurita"
Mupen_releaseURL=""


Mupen_cleanup(){
 echo "NYI"
}

#Install
Mupen_install(){
	setMSG "${Mupen_emuName}: Install"
	setMSG "Installing ${Mupen_emuName}"			
	termux-open "https://play.google.com/store/apps/details?id=org.mupen64plusae.v3.fzurita"
	#Mupen_init
}

#ApplyInitialSettings
Mupen_init(){
	setMSG "${Mupen_emuName}: Apply initial config"
	echo ""
	configEmuFP "${Mupen_emuName}" "${Mupen_emuPath}" "true"
	# Mupen_setupStorage
	#Mupen_setEmulationFolder
	# Mupen_setupSaves
}

#update
Mupen_update(){
	setMSG "${Mupen_emuName}: Apply configuration Update"
	echo ""
	configEmuFP "${Mupen_emuName}" "${Mupen_emuPath}"
	# Mupen_setupStorage
	# Mupen_setEmulationFolder
	# Mupen_setupSaves
}

#ConfigurePaths
Mupen_setEmulationFolder(){
	setMSG "${Mupen_emuName}: Configure Emulation folder"
	echo ""
	configFile="$HOME/storage/shared/Mupen-mmjr/Config/Mupen.ini"
	gameDirOpt1='ISOPath0 = '
	gameDirOpt1Setting='ISOPath0 = '"${romsPath}/gc"
	gameDirOpt2='ISOPath1 = '
	gameDirOpt2Setting='ISOPath1 = '"${romsPath}/wii"
	sed -i "/${gameDirOpt1}/c\\${gameDirOpt1Setting}" "$configFile"
	sed -i "/${gameDirOpt2}/c\\${gameDirOpt2Setting}" "$configFile"
}

#SetupSaves
Mupen_setupSaves(){
	setMSG "${Mupen_emuName}: setup Saves folder"
	# echo ""
	# linkToSaveFolder Mupen GC "$HOME/.var/app/org.MupenEmu.Mupen-emu/data/Mupen-emu/GC"
	# linkToSaveFolder Mupen Wii "$HOME/.var/app/org.MupenEmu.Mupen-emu/data/Mupen-emu/Wii"
	# linkToSaveFolder Mupen states "$HOME/.var/app/org.MupenEmu.Mupen-emu/data/Mupen-emu/states"
}


#SetupStorage
Mupen_setupStorage(){
	echo "NYI"#TBD
}


#WipeSettings
Mupen_wipe(){
   #rm -rf "$HOME/.var/app/$Mupen_emuPath"
   echo "NYI" 
   # prob not cause roms are here
}


#Uninstall
Mupen_uninstall(){
	echo "NYI" 
	#flatpak uninstall "$Mupen_emuPath" --user -y
}

#setABXYstyle
Mupen_setABXYstyle(){
	   echo "NYI" 
}

#Migrate
Mupen_migrate(){
		echo "NYI"
}

#WideScreenOn
Mupen_wideScreenOn(){
	setMSG "${Mupen_emuName}: Widescreen On"
	echo ""
	configFile="$HOME/storage/shared/Mupen-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = True'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 1'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#WideScreenOff
Mupen_wideScreenOff(){
	setMSG "${Mupen_emuName}: Widescreen Off"
	echo ""
	configFile="$HOME/storage/shared/Mupen-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = False'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 0'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#BezelOn
Mupen_bezelOn(){
echo "NYI"
}

#BezelOff
Mupen_bezelOff(){
echo "NYI"
}

#finalExec - Extra stuff
Mupen_finalize(){
	echo "NYI"
}

