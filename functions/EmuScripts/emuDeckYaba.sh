#!/bin/bash

#variables
Yaba_emuName="Yaba"
Yaba_emuType="store"
Yaba_emuPath="$HOME/Android/data/org.Yaba64plusae.v3.fzurita"
Yaba_releaseURL=""


Yaba_cleanup(){
 echo "NYI"
}

#Install
Yaba_install(){
	setMSG "${Yaba_emuName}: Install"
	setMSG "Installing ${Yaba_emuName}"			
	termux-open "https://play.google.com/store/apps/details?id=org.devmiyax.yabasanshioro2.pro"
	#Yaba_init
}

#ApplyInitialSettings
Yaba_init(){
	setMSG "${Yaba_emuName}: Apply initial config"
	echo ""
	configEmuFP "${Yaba_emuName}" "${Yaba_emuPath}" "true"
	# Yaba_setupStorage
	#Yaba_setEmulationFolder
	# Yaba_setupSaves
}

#update
Yaba_update(){
	setMSG "${Yaba_emuName}: Apply configuration Update"
	echo ""
	configEmuFP "${Yaba_emuName}" "${Yaba_emuPath}"
	# Yaba_setupStorage
	# Yaba_setEmulationFolder
	# Yaba_setupSaves
}

#ConfigurePaths
Yaba_setEmulationFolder(){
	setMSG "${Yaba_emuName}: Configure Emulation folder"
	echo ""
	configFile="$HOME/storage/shared/Yaba-mmjr/Config/Yaba.ini"
	gameDirOpt1='ISOPath0 = '
	gameDirOpt1Setting='ISOPath0 = '"${romsPath}/gc"
	gameDirOpt2='ISOPath1 = '
	gameDirOpt2Setting='ISOPath1 = '"${romsPath}/wii"
	sed -i "/${gameDirOpt1}/c\\${gameDirOpt1Setting}" "$configFile"
	sed -i "/${gameDirOpt2}/c\\${gameDirOpt2Setting}" "$configFile"
}

#SetupSaves
Yaba_setupSaves(){
	setMSG "${Yaba_emuName}: setup Saves folder"
	# echo ""
	# linkToSaveFolder Yaba GC "$HOME/.var/app/org.YabaEmu.Yaba-emu/data/Yaba-emu/GC"
	# linkToSaveFolder Yaba Wii "$HOME/.var/app/org.YabaEmu.Yaba-emu/data/Yaba-emu/Wii"
	# linkToSaveFolder Yaba states "$HOME/.var/app/org.YabaEmu.Yaba-emu/data/Yaba-emu/states"
}


#SetupStorage
Yaba_setupStorage(){
	echo "NYI"#TBD
}


#WipeSettings
Yaba_wipe(){
   #rm -rf "$HOME/.var/app/$Yaba_emuPath"
   echo "NYI" 
   # prob not cause roms are here
}


#Uninstall
Yaba_uninstall(){
	echo "NYI" 
	#flatpak uninstall "$Yaba_emuPath" --user -y
}

#setABXYstyle
Yaba_setABXYstyle(){
	   echo "NYI" 
}

#Migrate
Yaba_migrate(){
		echo "NYI"
}

#WideScreenOn
Yaba_wideScreenOn(){
	setMSG "${Yaba_emuName}: Widescreen On"
	echo ""
	configFile="$HOME/storage/shared/Yaba-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = True'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 1'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#WideScreenOff
Yaba_wideScreenOff(){
	setMSG "${Yaba_emuName}: Widescreen Off"
	echo ""
	configFile="$HOME/storage/shared/Yaba-mmjr/Config/GFX.ini"
	wideScreenHack='wideScreenHack = '
	wideScreenHackSetting='wideScreenHack = False'
	aspectRatio='AspectRatio = '
	aspectRatioSetting='AspectRatio = 0'
	sed -i "/${wideScreenHack}/c\\${wideScreenHackSetting}" "$configFile"
	sed -i "/${aspectRatio}/c\\${aspectRatioSetting}" "$configFile"
}

#BezelOn
Yaba_bezelOn(){
echo "NYI"
}

#BezelOff
Yaba_bezelOff(){
echo "NYI"
}

#finalExec - Extra stuff
Yaba_finalize(){
	echo "NYI"
}

