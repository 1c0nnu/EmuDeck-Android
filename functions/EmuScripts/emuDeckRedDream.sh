#!/bin/bash

#variables
RedDream_emuName="RedDream"
RedDream_emuType="store"
RedDream_emuPath="$HOME/Android/data/io.recompiled.redream"
RedDream_releaseURL=""


RedDream_cleanup(){
 echo "NYI"
}

#Install
RedDream_install(){
	setMSG "${RedDream_emuName}: Install"
	setMSG "Installing ${RedDream_emuName}"			
	termux-open "https://play.google.com/store/apps/details?id=io.recompiled.redream"
	#RedDream_init
}

#ApplyInitialSettings
RedDream_init(){
	setMSG "${RedDream_emuName}: Apply initial config"
	echo ""
	configEmuFP "${RedDream_emuName}" "${RedDream_emuPath}" "true"
	# RedDream_setupStorage
	#RedDream_setEmulationFolder
	# RedDream_setupSaves
}

#update
RedDream_update(){
	setMSG "${RedDream_emuName}: Apply configuration Update"
	echo ""
	configEmuFP "${RedDream_emuName}" "${RedDream_emuPath}"
	# RedDream_setupStorage
	# RedDream_setEmulationFolder
	# RedDream_setupSaves
}

#ConfigurePaths
RedDream_setEmulationFolder(){
	setMSG "${RedDream_emuName}: Configure Emulation folder"
	echo ""
	configFile="$HOME/storage/shared/RedDream-mmjr/Config/RedDream.ini"
	gameDirOpt1='ISOPath0 = '
	gameDirOpt1Setting='ISOPath0 = '"${romsPath}/gc"
	gameDirOpt2='ISOPath1 = '
	gameDirOpt2Setting='ISOPath1 = '"${romsPath}/wii"
	sed -i "/${gameDirOpt1}/c\\${gameDirOpt1Setting}" "$configFile"
	sed -i "/${gameDirOpt2}/c\\${gameDirOpt2Setting}" "$configFile"
}

#SetupSaves
RedDream_setupSaves(){
	setMSG "${RedDream_emuName}: setup Saves folder"
	# echo ""
	# linkToSaveFolder RedDream GC "$HOME/.var/app/org.RedDreamEmu.RedDream-emu/data/RedDream-emu/GC"
	# linkToSaveFolder RedDream Wii "$HOME/.var/app/org.RedDreamEmu.RedDream-emu/data/RedDream-emu/Wii"
	# linkToSaveFolder RedDream states "$HOME/.var/app/org.RedDreamEmu.RedDream-emu/data/RedDream-emu/states"
}


#SetupStorage
RedDream_setupStorage(){
	echo "NYI"#TBD
}


#WipeSettings
RedDream_wipe(){
   #rm -rf "$HOME/.var/app/$RedDream_emuPath"
   echo "NYI" 
   # prob not cause roms are here
}


#Uninstall
RedDream_uninstall(){
	echo "NYI" 
	#flatpak uninstall "$RedDream_emuPath" --user -y
}

#setABXYstyle
RedDream_setABXYstyle(){
	   echo "NYI" 
}

#Migrate
RedDream_migrate(){
		echo "NYI"
}

#WideScreenOn
RedDream_wideScreenOn(){
	setMSG "${RedDream_emuName}: Widescreen On"
	echo ""
	configFile="$HOME/storage/shared/RedDream-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = True'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 1'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#WideScreenOff
RedDream_wideScreenOff(){
	setMSG "${RedDream_emuName}: Widescreen Off"
	echo ""
	configFile="$HOME/storage/shared/RedDream-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = False'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 0'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#BezelOn
RedDream_bezelOn(){
echo "NYI"
}

#BezelOff
RedDream_bezelOff(){
echo "NYI"
}

#finalExec - Extra stuff
RedDream_finalize(){
	echo "NYI"
}

