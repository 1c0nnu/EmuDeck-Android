#!/bin/bash

function installLaunchbox(){
	installLaunch=true
	DIR=~/storage/shared/Android/data/com.magneticchen.daijishou
	FOLDER=$(test -d "$DIR" && echo -n "true")
	case $FOLDER in
	  *"true"*)
		  installLaunch=false
		;;
	esac
	if [[  $installLaunch == true ]]; then
		echo -e  "Press the ${RED}A button${NONE} to go to LaunchBox website, when it is installed come back to continue the next steps"
		read pause
		termux-open "https://www.launchbox-app.com/android-download"
	fi
}