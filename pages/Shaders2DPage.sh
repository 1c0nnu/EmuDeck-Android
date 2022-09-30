#!/bin/sh
while true; do
	question=$(whiptail --title "Configure CRT Shader for Classic 2D Games" \
   --radiolist "Enabling a CRT Shader gives your classic systems a faux retro CRT vibe" 10 80 4 \
	"ON" "Enable" OFF \
	"OFF" "Disable" OFF \
   3>&1 1<&2 2>&3)
	case $question in
		[ON]* ) break;;
		[OFF]* ) break;;
		* ) echo "Please answer yes or no.";;
	esac
done

if [ $question == 'ON' ]; then
	setSetting RAHandClassic2D true
else
	setSetting RAHandClassic2D false
fi