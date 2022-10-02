#!/bin/bash

function Pegasus_install(){
	
	installPegasus=true
	DIR=~/storage/shared/Android/data/org.pegasus_frontend.android
	FOLDER=$(test -d "$DIR" && echo -n "true")
	case $FOLDER in
	  *"true"*)
		installPegasus=false
		;;
	esac
	
	if [[  $installPegasus == true ]]; then
		#Download Pegasus		
		setMSG "Pegasus: Install"
		local releaseURL="$(getLatestReleaseURLGH "mmatyas/pegasus-frontend" "apk")"
		setMSG "Installing Pegasus"		
		curl -L "$releaseURL" -o "Pegasus.apk"
		clear
		echo -e  "Press the ${RED}A button${NONE} to install Pegasus, when it is installed come back to continue the next steps"
		xdg-open "Pegasus.apk"
		Pegasus_init
	fi

}

function Pegasus_init(){					
	mkdir -p ~/storage/shared/pegasus-frontend
	mkdir -p ~/storage/shared/pegasus-frontend/themes
	cp ~/storage/shared/pegasus-frontend/settings.txt ~/storage/shared/pegasus-frontend/settings.txt.bak
	cp ~/storage/shared/pegasus-frontend/game_dirs.txt ~/storage/shared/pegasus-frontend/game_dirs.txt.bak
	cp $EMUDECKGIT/configs/pegasus-frontend/settings.txt ~/storage/shared/pegasus-frontend
	cp $EMUDECKGIT/configs/pegasus-frontend/game_dirs.txt ~/storage/shared/pegasus-frontend
	
	if [ $android -lt 11 ]; then
		if [ $romPathSelection == 'INTERNAL' ]; then
			sed -i "s/0000-0000/emulated\/0/g" ~/storage/shared/pegasus-frontend/game_dirs.txt
		else
			sed -i "s/0000-0000\//${sdcardID}\/Android\/data\/com.termux\/files\//g" ~/storage/shared/pegasus-frontend/game_dirs.txt
		fi
	else
		sed -i "s/0000-0000\//${sdcardID}\/Emulation\/roms\//g" ~/storage/shared/pegasus-frontend/game_dirs.txt
	fi
}


#/storage/0000-0000/Emulation/roms/3ds

