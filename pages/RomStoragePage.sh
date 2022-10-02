#!/bin/bash

	
	if [ $hasSDCARD == true ]; then
		
		while true; do
			romPathSelection=$(whiptail --title "Choose your Storage" \
   		--radiolist "Where do you want to store your roms? " 10 90 4 \
			"INTERNAL" "We will create your rom folders on your Internal Storage" OFF \
			"SDCARD" "We will create your rom folders on your SD Card ( not formated as external)" OFF \
   		3>&1 1<&2 2>&3)
			case $romPathSelection in
				[INTERNAL]* ) break;;
				[SDCARD]* ) break;;
				* ) echo "Please choose your Storage.";;
			esac
		done
		
		if [ $romPathSelection == 'INTERNAL' ]; then
			path="$HOME/storage/shared"
		else		
			SDPath=$(readlink ~/storage/external-1)
			firstString=$SDPath
			secondString=""
			sdcardID="${firstString/"/storage/"/"$secondString"}"
			firstString=$sdcardID
			secondString=""
			sdcardID="${firstString/"/Android/data/com.termux/files"/"$secondString"}" 
			path="$HOME/storage/external-1"
			
		fi
		
	
	else
		path="$HOME/storage/shared"
	fi

if [ $android -gt 9 ]; then
	path="$HOME/storage/shared"
fi

setSetting emulationPath $path/Emulation


setSetting romsPath $path/Emulation/roms
setSetting toolsPath $path/Emulation/tools
setSetting biosPath $path/Emulation/bios
setSetting savesPath $path/Emulation/saves
setSetting storagePath $path/Emulation/storage