#!/bin/bash
while true; do
	question=$(whiptail --title "Pegasus Theme" \
   --checklist "What Pegasus theme do you want to install" 10 80 4 \
	"EPIC" "RP - Epic Noir" ON \
	"SWITCH" "RP - Switch" OFF \
	"MEGA" "Retro Mega" OFF \
	"GAMEOS" "GameOS" OFF \
	"NEORETRO" "NeoRetro Dark" OFF \
   3>&1 1<&2 2>&3)
	case $question in
		[EPIC]* ) break;;
		[SWITCH]* ) break;;
		[MEGA]* ) break;;
		[GAMEOS]* ) break;;
		[NEORETRO]* ) break;;
		* ) echo "Please answer yes or no.";;
	esac
done

case $question in
	 "EPIC")
		 setSetting doInstallThemeEpic true
	 ;;
	 "SWITCH")
		 setSetting doInstallThemeSwitch true
	 ;;
	 "MEGA")
		 setSetting doInstallThemeMega true
	 ;;
	 "GAMEOS")
		 setSetting doInstallThemeGameOS true
	 ;;
	 "NEORETRO")
		 setSetting doInstallThemeNeoRetro true
	 ;;
	 *)
		 echo "default"
	 ;;
 esac