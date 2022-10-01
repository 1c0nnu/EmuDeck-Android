#!/bin/bash

function ResetCollection_install(){
	installReset=true
	DIR=~/storage/shared/Android/data/com.retroloungelab.resetcollection
	FOLDER=$(test -d "$DIR" && echo -n "true")
	case $FOLDER in
	  *"true"*)
		  installReset=false
		
		;;
	esac
	if [[  $installReset == true ]]; then
		clear
		echo -e  "Press the ${RED}A button${NONE} to install Reset Collection, when it is installed come back to continue the next steps"
		read pause
		termux-open "https://play.google.com/store/apps/details?id=com.retroloungelab.resetcollection"
	fi
}