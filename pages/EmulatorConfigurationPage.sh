#!/bin/sh

case $devicePower in
"0")	
	while true; do
		question=$(whiptail --title "Emulators" \
	   --checklist "If you want to keep your custom setting for some emus, leave them unchecked. Checked means we will overwrite your configuration" 10 80 4 \
		"RA" "RetroArch - Classic 2D and 3D Games" ON \
		"DOLPHIN" "Dolphin - GameCube and Wii" ON \
		"DUCK" "Duckstation - Playstation 1" ON \
		"AETHERSX2" "AetherSX2 - Playstation 2" ON \
		"CITRA" "Citra - Nintendo 3DS" ON \
		"PPSSPP" "PPSSPP - Sony PSP" ON \
		"SKYLINE" "PPSSPP - Nintendo Switch" ON \
	   3>&1 1<&2 2>&3)
		case $question in
			[RA]* ) break;;
			[DOLPHIN]* ) break;;
			[DUCK]* ) break;;
			[AETHERSX2]* ) break;;
			[CITRA]* ) break;;
			[PPSSPP]* ) break;;
			[SKYLINE]* ) break;;
			* ) echo "Please answer yes or no.";;
		esac
	done
;;
"1")	
	while true; do
		question=$(whiptail --title "Emulators" \
	   --checklist "If you want to keep your custom setting for some emus, leave them unchecked. Checked means we will overwrite your configuration" 10 80 4 \
		"RA" "RetroArch - Classic 2D and 3D Games" ON \
		"DOLPHIN" "Dolphin - GameCube and Wii" ON \
		"DUCK" "Duckstation - Playstation 1" ON \
		"AETHERSX2" "AetherSX2 - Playstation 2" ON \
		"CITRA" "Citra - Nintendo 3DS" ON \
		"PPSSPP" "PPSSPP - Sony PSP" ON \
		"SKYLINE" "PPSSPP - Nintendo Switch" ON \
	   3>&1 1<&2 2>&3)
		case $question in
			[RA]* ) break;;
			[DOLPHIN]* ) break;;
			[DUCK]* ) break;;
			[AETHERSX2]* ) break;;
			[CITRA]* ) break;;
			[PPSSPP]* ) break;;
			[SKYLINE]* ) break;;
			* ) echo "Please answer yes or no.";;
		esac
	done
;;
"2")
	while true; do
		question=$(whiptail --title "Emulators" \
	   --checklist "If you want to keep your custom setting for some emus, leave them unchecked. Checked means we will overwrite your configuration" 10 80 4 \
		"RA" "RetroArch - Classic 2D and 3D Games" ON \
		"DOLPHIN" "Dolphin - GameCube and Wii" ON \
		"DUCK" "Duckstation - Playstation 1" ON \
		"AETHERSX2" "AetherSX2 - Playstation 2" ON \
		"CITRA" "Citra - Nintendo 3DS" ON \
		"PPSSPP" "PPSSPP - Sony PSP" ON \
		"SKYLINE" "PPSSPP - Nintendo Switch" ON \
	   3>&1 1<&2 2>&3)
		case $question in
			[RA]* ) break;;
			[DOLPHIN]* ) break;;
			[DUCK]* ) break;;
			[AETHERSX2]* ) break;;
			[CITRA]* ) break;;
			[PPSSPP]* ) break;;
			[SKYLINE]* ) break;;
			* ) echo "Please answer yes or no.";;
		esac
	done	
;;
*)
	echo "default"
;;
esac



case $question in
	"RA")
		setSetting doSetupRA true
	;;
	"DOLPHIN")
		setSetting doSetupDolphin true
	;;
	"DUCK")
		setSetting doSetupDuck true
	;;
	"AETHERSX2")
		setSetting doSetupPCSX2 true
	;;
	"CITRA")
		setSetting doSetupCitra true
	;;
	"PPSSPP")
		setSetting doSetupPPSSPP true
	;;
	"SKYLINE")
		setSetting doSetupSkyline true
	;;
	*)
		echo "default"
	;;
esac