#!/bin/bash

#variables
Citra_emuName="citra-emu"
Citra_emuType="apk"
Citra_emuPath="$HOME/storage/shared/citra-emu"
Citra_releaseURL=""

#cleanupOlderThings
Citra_cleanup(){
 echo "NYI"
}

#Install
Citra_install(){
	setMSG "${Citra_emuName}: Install"
	local releaseURL="$(getLatestReleaseURLGH "weihuoya/citra" "apk")"
	setMSG "Installing ${Citra_emuName}"		
	curl -L "$releaseURL" -o "${Citra_emuName}.apk"
	xdg-open "${Citra_emuName}.apk"
	#Citra_init
}

#ApplyInitialSettings
Citra_init(){
	setMSG "${Citra_emuName}: Apply initial config"
	echo ""
	configEmuFP "${Citra_emuName}" "${Citra_emuPath}" "true"
	# Citra_setupStorage
	#Citra_setEmulationFolder
	# Citra_setupSaves
}

#update
Citra_update(){
	setMSG "${Citra_emuName}: Apply configuration Update"
	echo ""
	configEmuFP "${Citra_emuName}" "${Citra_emuPath}"
	# Citra_setupStorage
	# Citra_setEmulationFolder
	# Citra_setupSaves
}

#ConfigurePaths
Citra_setEmulationFolder(){
	setMSG "${Citra_emuName}: Configure Emulation folder"
	echo ""
	configFile="$HOME/storage/shared/Citra-mmjr/Config/Citra.ini"
	gameDirOpt1='ISOPath0 = '
	gameDirOpt1Setting='ISOPath0 = '"${romsPath}/gc"
	gameDirOpt2='ISOPath1 = '
	gameDirOpt2Setting='ISOPath1 = '"${romsPath}/wii"
	sed -i "/${gameDirOpt1}/c\\${gameDirOpt1Setting}" "$configFile"
	sed -i "/${gameDirOpt2}/c\\${gameDirOpt2Setting}" "$configFile"
}

#SetupSaves
Citra_setupSaves(){
	setMSG "${Citra_emuName}: setup Saves folder"
	# echo ""
	# linkToSaveFolder Citra GC "$HOME/.var/app/org.CitraEmu.Citra-emu/data/Citra-emu/GC"
	# linkToSaveFolder Citra Wii "$HOME/.var/app/org.CitraEmu.Citra-emu/data/Citra-emu/Wii"
	# linkToSaveFolder Citra states "$HOME/.var/app/org.CitraEmu.Citra-emu/data/Citra-emu/states"
}


#SetupStorage
Citra_setupStorage(){
	echo "NYI"#TBD
}


#WipeSettings
Citra_wipe(){
   #rm -rf "$HOME/.var/app/$Citra_emuPath"
   echo "NYI" 
   # prob not cause roms are here
}


#Uninstall
Citra_uninstall(){
	echo "NYI" 
	#flatpak uninstall "$Citra_emuPath" --user -y
}

#setABXYstyle
Citra_setABXYstyle(){
	   echo "NYI" 
}

#Migrate
Citra_migrate(){
		echo "NYI"
}

#WideScreenOn
Citra_wideScreenOn(){
	setMSG "${Citra_emuName}: Widescreen On"
	echo ""
	configFile="$HOME/storage/shared/Citra-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = True'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 1'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#WideScreenOff
Citra_wideScreenOff(){
	setMSG "${Citra_emuName}: Widescreen Off"
	echo ""
	configFile="$HOME/storage/shared/Citra-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = False'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 0'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#BezelOn
Citra_bezelOn(){
echo "NYI"
}

#BezelOff
Citra_bezelOff(){
echo "NYI"
}

#finalExec - Extra stuff
Citra_finalize(){
	echo "NYI"
}

