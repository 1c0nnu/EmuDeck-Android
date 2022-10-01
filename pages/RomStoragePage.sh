#!/bin/bash

if [ $hasSDCARD == true ]; then
	
	while true; do
		romPathSelection=$(whiptail --title "Choose your Storage" \
   	--radiolist "Where do you want to store your roms? " 10 80 4 \
		"INTERNAL" "We will create your rom folders on your Internal Storage" OFF \
		"SDCARD" "We will create your rom folders on your SD Card" OFF \
   	3>&1 1<&2 2>&3)
		case $romPathSelection in
			[INTERNAL]* ) break;;
			[SDCARD]* ) break;;
			* ) echo "Please choose your Storage.";;
		esac
	done
	
	if [ $romPathSelection == 'INTERNAL' ]; then
		PATH=$HOME/storage/shared/
	else		
		SDPath=$(readlink ~/storage/external-1)
		firstString=$SDPath
		secondString=""
		sdcardID="${firstString/"/storage/"/"$secondString"}"
		firstString=$sdcardID
		secondString=""
		sdcardID="${firstString/"/Android/data/com.termux/files"/"$secondString"}" 
		PATH=$sdcardID
		
		
		
	fi
	

else
	PATH=$HOME/storage/shared/
fi

setSetting emulationPath $PATH/Emulation
setSetting romsPath $PATH/Emulation/roms
setSetting toolsPath $PATH/Emulation/tools
setSetting biosPath $PATH/Emulation/bios
setSetting savesPath $PATH/Emulation/saves
setSetting storagePath $PATH/Emulation/storage