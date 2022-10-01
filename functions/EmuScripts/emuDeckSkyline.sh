#!/bin/bash

#variables
Skyline_emuName="Skyline"
Skyline_emuType="apk"
Skyline_emuPath="$HOME/storage/shared/Skyline-mmjr"
Skyline_releaseURL=""

#cleanupOlderThings
Skyline_cleanup(){
 echo "NYI"
}

#Install
Skyline_install(){
	setMSG "${Skyline_emuName}: Install"
	wget  -q --show-progress https://skyline-builds.alula.gay/cache/2982132369/skyline-1340-release.apk -P ~/ && xdg-open ~/skyline-1340-release.apk	

}

#ApplyInitialSettings
Skyline_init(){
	setMSG "${Skyline_emuName}: Apply initial config"
	echo ""
	configEmuFP "${Skyline_emuName}" "${Skyline_emuPath}" "true"
	# Skyline_setupStorage
	Skyline_setEmulationFolder
	# Skyline_setupSaves
}

#update
Skyline_update(){
	setMSG "${Skyline_emuName}: Apply configuration Update"
	echo ""
	configEmuFP "${Skyline_emuName}" "${Skyline_emuPath}"
	# Skyline_setupStorage
	# Skyline_setEmulationFolder
	# Skyline_setupSaves
}

#ConfigurePaths
Skyline_setEmulationFolder(){
	setMSG "${Skyline_emuName}: Configure Emulation folder"
	echo ""
	configFile="$HOME/storage/shared/Skyline-mmjr/Config/Skyline.ini"
	gameDirOpt1='ISOPath0 = '
	gameDirOpt1Setting='ISOPath0 = '"${romsPath}/gc"
	gameDirOpt2='ISOPath1 = '
	gameDirOpt2Setting='ISOPath1 = '"${romsPath}/wii"
	sed -i "/${gameDirOpt1}/c\\${gameDirOpt1Setting}" "$configFile"
	sed -i "/${gameDirOpt2}/c\\${gameDirOpt2Setting}" "$configFile"
}

#SetupSaves
Skyline_setupSaves(){
	setMSG "${Skyline_emuName}: setup Saves folder"
	# echo ""
	# linkToSaveFolder Skyline GC "$HOME/.var/app/org.SkylineEmu.Skyline-emu/data/Skyline-emu/GC"
	# linkToSaveFolder Skyline Wii "$HOME/.var/app/org.SkylineEmu.Skyline-emu/data/Skyline-emu/Wii"
	# linkToSaveFolder Skyline states "$HOME/.var/app/org.SkylineEmu.Skyline-emu/data/Skyline-emu/states"
}


#SetupStorage
Skyline_setupStorage(){
	echo "NYI"#TBD
}


#WipeSettings
Skyline_wipe(){
   #rm -rf "$HOME/.var/app/$Skyline_emuPath"
   echo "NYI" 
   # prob not cause roms are here
}


#Uninstall
Skyline_uninstall(){
	echo "NYI" 
	#flatpak uninstall "$Skyline_emuPath" --user -y
}

#setABXYstyle
Skyline_setABXYstyle(){
	   echo "NYI" 
}

#Migrate
Skyline_migrate(){
		echo "NYI"
}

#WideScreenOn
Skyline_wideScreenOn(){
	setMSG "${Skyline_emuName}: Widescreen On"
	echo ""
	configFile="$HOME/storage/shared/Skyline-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = True'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 1'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#WideScreenOff
Skyline_wideScreenOff(){
	setMSG "${Skyline_emuName}: Widescreen Off"
	echo ""
	configFile="$HOME/storage/shared/Skyline-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = False'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 0'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#BezelOn
Skyline_bezelOn(){
echo "NYI"
}

#BezelOff
Skyline_bezelOff(){
echo "NYI"
}

#finalExec - Extra stuff
Skyline_finalize(){
	echo "NYI"
}

