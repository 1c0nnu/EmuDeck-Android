#!/bin/bash
case $devicePower in
0)		
		question=$(whiptail --title "Emulators" \
	   --checklist "These are the emulators you can install. We've disabled those not recommended for your device. You can disable more emulators if you don't want to install all of them" 10 80 4 \
		"RA" "RetroArch - Classic 2D and 3D Games" ON \
		"DOLPHIN" "Dolphin - GameCube and Wii" ON \
		"DUCK" "Duckstation - Playstation 1" ON \
		"AETHERSX2" "AetherSX2 - Playstation 2" OFF \
		"CITRA" "Citra - Nintendo 3DS" OFF \
		"PPSSPP" "PPSSPP - Sony PSP" ON \
		"SKYLINE" "PPSSPP - Nintendo Switch" OFF \
	   3>&1 1<&2 2>&3)
	
;;
1)	
		question=$(whiptail --title "Emulators" \
	   --checklist "These are the emulators you can install. We've disabled those not recommended for your device. You can disable more emulators if you don't want to install all of them" 10 80 4 \
		"RA" "RetroArch - Classic 2D and 3D Games" ON \
		"DOLPHIN" "Dolphin - GameCube and Wii" ON \
		"DUCK" "Duckstation - Playstation 1" ON \
		"AETHERSX2" "AetherSX2 - Playstation 2" ON \
		"CITRA" "Citra - Nintendo 3DS" ON \
		"PPSSPP" "PPSSPP - Sony PSP" ON \
		"SKYLINE" "PPSSPP - Nintendo Switch" OFF \
	   3>&1 1<&2 2>&3)	
	
;;
2)
		question=$(whiptail --title "Emulators" \
	   --checklist "These are the emulators you can install. We've disabled those not recommended for your device. You can disable more emulators if you don't want to install all of them" 10 80 4 \
		"RA" "RetroArch - Classic 2D and 3D Games" ON \
		"DOLPHIN" "Dolphin - GameCube and Wii" ON \
		"DUCK" "Duckstation - Playstation 1" ON \
		"AETHERSX2" "AetherSX2 - Playstation 2" ON \
		"CITRA" "Citra - Nintendo 3DS" ON \
		"PPSSPP" "PPSSPP - Sony PSP" ON \
		"SKYLINE" "PPSSPP - Nintendo Switch" ON \
	   3>&1 1<&2 2>&3)
	
;;
*)
	echo "no power"
;;
esac



case $question in
	"RA")
		setSetting doInstallRA true
	;;
	"DOLPHIN")
		setSetting doInstallDolphin true
	;;
	"DUCK")
		setSetting doInstallDuck true
	;;
	"AETHERSX2")
		setSetting doInstallPCSX2 true
	;;
	"CITRA")
		setSetting doInstallCitra true
	;;
	"PPSSPP")
		setSetting doInstallPPSSPP true
	;;
	"SKYLINE")
		setSetting doInstallSkyline true
	;;
	*)
		echo "default"
	;;
esac