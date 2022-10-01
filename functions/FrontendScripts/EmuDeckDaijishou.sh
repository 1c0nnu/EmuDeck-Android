#!/bin/bash
function Daijishou_install(){
	installDaihisho=true
	DIR=~/storage/shared/Android/data/com.magneticchen.daijishou
	FOLDER=$(test -d "$DIR" && echo -n "true")
	case $FOLDER in
	  *"true"*)
		  installDaihisho=false
		;;
	esac
	if [[  $installDaihisho == true ]]; then
		echo -e  "Press the ${RED}A button${NONE} to install Daijisho, when it is installed come back to continue the next steps"
		read pause
		termux-open "https://play.google.com/store/apps/details?id=com.magneticchen.daijishou"
	fi
}