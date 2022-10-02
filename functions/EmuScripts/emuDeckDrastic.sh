#!/bin/bash

#variables
Drastic_emuName="Drastic"
Drastic_emuType="store"
Drastic_emuPath="$HOME/Android/data/org.Drastic64plusae.v3.fzurita"
Drastic_releaseURL=""


Drastic_cleanup(){
 echo "NYI"
}

#Install
Drastic_install(){
	setMSG "${Drastic_emuName}: Install"
	setMSG "Installing ${Drastic_emuName}"			
	termux-open "https://play.google.com/store/apps/details?id=com.dsemu.drastic"
	#Drastic_init
}

#ApplyInitialSettings
Drastic_init(){
	setMSG "${Drastic_emuName}: Apply initial config"
	echo ""
	configEmuFP "${Drastic_emuName}" "${Drastic_emuPath}" "true"
	# Drastic_setupStorage
	#Drastic_setEmulationFolder
	# Drastic_setupSaves
}

#update
Drastic_update(){
	setMSG "${Drastic_emuName}: Apply configuration Update"
	echo ""
	configEmuFP "${Drastic_emuName}" "${Drastic_emuPath}"
	# Drastic_setupStorage
	# Drastic_setEmulationFolder
	# Drastic_setupSaves
}

#ConfigurePaths
Drastic_setEmulationFolder(){
	setMSG "${Drastic_emuName}: Configure Emulation folder"
	echo ""
	configFile="$HOME/storage/shared/Drastic-mmjr/Config/Drastic.ini"
	gameDirOpt1='ISOPath0 = '
	gameDirOpt1Setting='ISOPath0 = '"${romsPath}/gc"
	gameDirOpt2='ISOPath1 = '
	gameDirOpt2Setting='ISOPath1 = '"${romsPath}/wii"
	sed -i "/${gameDirOpt1}/c\\${gameDirOpt1Setting}" "$configFile"
	sed -i "/${gameDirOpt2}/c\\${gameDirOpt2Setting}" "$configFile"
}

#SetupSaves
Drastic_setupSaves(){
	setMSG "${Drastic_emuName}: setup Saves folder"
	# echo ""
	# linkToSaveFolder Drastic GC "$HOME/.var/app/org.DrasticEmu.Drastic-emu/data/Drastic-emu/GC"
	# linkToSaveFolder Drastic Wii "$HOME/.var/app/org.DrasticEmu.Drastic-emu/data/Drastic-emu/Wii"
	# linkToSaveFolder Drastic states "$HOME/.var/app/org.DrasticEmu.Drastic-emu/data/Drastic-emu/states"
}


#SetupStorage
Drastic_setupStorage(){
	echo "NYI"#TBD
}


#WipeSettings
Drastic_wipe(){
   #rm -rf "$HOME/.var/app/$Drastic_emuPath"
   echo "NYI" 
   # prob not cause roms are here
}


#Uninstall
Drastic_uninstall(){
	echo "NYI" 
	#flatpak uninstall "$Drastic_emuPath" --user -y
}

#setABXYstyle
Drastic_setABXYstyle(){
	   echo "NYI" 
}

#Migrate
Drastic_migrate(){
		echo "NYI"
}

#WideScreenOn
Drastic_wideScreenOn(){
	setMSG "${Drastic_emuName}: Widescreen On"
	echo ""
	configFile="$HOME/storage/shared/Drastic-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = True'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 1'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#WideScreenOff
Drastic_wideScreenOff(){
	setMSG "${Drastic_emuName}: Widescreen Off"
	echo ""
	configFile="$HOME/storage/shared/Drastic-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = False'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 0'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#BezelOn
Drastic_bezelOn(){
echo "NYI"
}

#BezelOff
Drastic_bezelOff(){
echo "NYI"
}

#finalExec - Extra stuff
Drastic_finalize(){
	echo "NYI"
}

