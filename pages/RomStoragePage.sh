#!/bin/bash

# if [ $hasSDCARD == true ]; then
# 	
# 	while true; do
# 		romPathSelection=$(whiptail --title "Choose your Storage" \
#    	--radiolist "Where do you want to store your roms? " 10 80 4 \
# 		"INTERNAL" "We will create your rom folders on your Internal Storage" OFF \
# 		"SDCARD" "We will create your rom folders on your SD Card" OFF \
#    	3>&1 1<&2 2>&3)
# 		case $romPathSelection in
# 			[INTERNAL]* ) break;;
# 			[SDCARD]* ) break;;
# 			* ) echo "Please choose your Storage.";;
# 		esac
# 	done
# 	
# 	if [ $romPathSelection == 'INTERNAL' ]; then
# 		PATH=$HOME/storage/shared/
# 	else		
# 		SDPath=$(readlink ~/storage/external-1)
# 		firstString=$SDPath
# 		secondString=""
# 		sdcardID="${firstString/"/storage/"/"$secondString"}"
# 		firstString=$sdcardID
# 		secondString=""
# 		sdcardID="${firstString/"/Android/data/com.termux/files"/"$secondString"}" 
# 		PATH=$sdcardID
# 		
# 		
# 		
# 	fi
# 	
# 
# else
# 	PATH=$HOME/storage/shared/
# fi

setSetting emulationPath $HOME/Emulation
setSetting romsPath $HOME/Emulation/roms
setSetting toolsPath $HOME/Emulation/tools
setSetting biosPath $HOME/Emulation/bios
setSetting savesPath $HOME/Emulation/saves
setSetting storagePath $HOME/Emulation/storage