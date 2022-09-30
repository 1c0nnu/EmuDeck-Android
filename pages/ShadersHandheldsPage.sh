#!/bin/bash
while true; do
	question=$(whiptail --title "Configure LCD Shader for Handhelds" \
   --radiolist "Enabling a LCD Shader simulates the old LCD Matrix screens of handheld systems" 10 80 4 \
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
	setSetting RAHandHeldShader true
else
	setSetting RAHandHeldShader false
fi