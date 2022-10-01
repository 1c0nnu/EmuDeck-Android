#!/bin/bash

function installArc(){
	installArc=true
	DIR=~/storage/shared/Android/data/com.magneticchen.daijishou
	FOLDER=$(test -d "$DIR" && echo -n "true")
	case $FOLDER in
	  *"true"*)
		  installArc=false
		;;
	esac
	if [[  $installArc == true ]]; then
		echo -e  "Press the ${RED}A button${NONE} to install Arc Browser, when it is installed come back to continue the next steps"
		read pause
		termux-open "https://play.google.com/store/apps/details?id=net.floatingpoint.android.arcturus"
		
	fi
}