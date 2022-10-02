#!/bin/bash
NONE='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'
BOLD='\033[1m'
UNDERLINE='\033[4m'
BLINK='\x1b[5m'
EMUDECKGIT="$HOME/EmuDeck/backend"
source "$EMUDECKGIT"/functions/all.sh

clear
echo -e "EmuDeck for ${GREEN}Android${NONE} ${RED}BETA${NONE}"
echo -e  "${BOLD}You must hide the virtual keyboard to continue so you can read all the instructions${NONE}"
echo -e  "If your controller is not being recognized you might need to connect a Keyboard."
echo -e  "Press the ${RED}A button${NONE} when ready"
read clear
clear


# "1" "Update & Configure EmuDeck" ON \
# "2" "Scrape your Roms (Android 10 only)" OFF \
# "3" "Compress your Roms" OFF \
# "4" "Change SNES Aspect Ratio" OFF \
# "5" "Turn Bezels ON/OFF" OFF \
# "6" "Reset Screen Scraper credentials" OFF \
# "7" "Uninstall EmuDeck" OFF \
# "8" "Open Termux CLI" OFF \
# "9" "Reinstall Termux dependencies" OFF \
# "10" "Exit" OFF \

while true; do
	selected_option=$(whiptail --title "EmuDeck Menu" --radiolist "Move using your DPAD and select your options with the Y button. Press the A button to select." 20 80 15 \
	"1" "Update & Configure EmuDeck" ON \
	"2" "Pegasus Artwork Scrapper" OFF \
	"3" "Change Nintendo Aspect Ratio" OFF \
	"4" "Change Sega Aspect Ratio" OFF \
	"5" "Turn Bezels ON/OFF" OFF \
	"6" "Open Termux CLI" OFF \
	"10" "Exit" OFF \
	3>&1 1>&2 2>&3)
	case $selected_option in
		[1]* ) break;;
		[2]* ) break;;
		[3]* ) break;;
		[4]* ) break;;
		[5]* ) break;;
		[6]* ) break;;
		[7]* ) break;;
		[8]* ) break;;
		[9]* ) break;;
		[10]* ) break;;
		* ) echo "Please hide your keyboard";;
	esac
done

if [[ $selected_option == "1" ]]
then
	/bin/bash ~/EmuDeck/backend/install.sh
fi

if [[ $selected_option == "2" ]]
then
	/bin/bash ~/EmuDeck/backend/scrap.sh
fi

if [[ $selected_option == "3" ]]
then
	source "$EMUDECKGIT"/pages/AspectRatioSNESPage.sh
	RetroArch_setARNintendo
	am startservice -a com.termux.service_stop com.termux/.app.TermuxService &> /dev/null
	
fi

if [[ $selected_option == "4" ]]
then
	source "$EMUDECKGIT"/pages/AspectRatioSegaPage.sh
	RetroArch_setARSega
	am startservice -a com.termux.service_stop com.termux/.app.TermuxService &> /dev/null
	
fi

if [[ $selected_option == "5" ]]
then
	source "$EMUDECKGIT"/pages/RABezelsPage.sh
	RetroArch_setBezels
	am startservice -a com.termux.service_stop com.termux/.app.TermuxService &> /dev/null
	
fi

if [[ $selected_option == "6" ]]
then
	cd $HOME
	clear	
fi

if [[ $selected_option == "10" ]]
then
	am startservice -a com.termux.service_stop com.termux/.app.TermuxService &> /dev/null
fi