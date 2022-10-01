#!/bin/bash

function Dig_install(){
	installDig=true
	DIR=~/storage/shared/Android/data/com.magneticchen.daijishou
	FOLDER=$(test -d "$DIR" && echo -n "true")
	case $FOLDER in
	  *"true"*)
		  installDig=false
		;;
	esac
	if [[  $installDig == true ]]; then
		echo -e  "Press the ${RED}A button${NONE} to install Dig, when it is installed come back to continue the next steps"
		read pause
		termux-open "https://play.google.com/store/apps/details?id=com.digdroid.alman.dig"	
	fi
}