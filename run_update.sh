#!/bin/sh

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
clear
echo "### Update started - Log cleaned up "  &>> ~/storage/shared/emudeck.log

FILE=~/emudeck/.device
if [ -f "$FILE" ]; then
 echo ""
else
	while true; do
		handheldModel=$(whiptail --title "What Android Device do you have" \
	   --radiolist "Move using your DPAD and select your platforms with the Y button. Press the A button to select." 10 80 4 \
		"RG552" "Anbernic RG552" OFF \
		"ODIN" "16:9 Devices like Odin or RP3" OFF \
		"RP2+" "4:3 Devices Like RP2+ and RG553" OFF \
		"ANDROID" "A regular Android Device" OFF \
	   3>&1 1<&2 2>&3)
		case $handheldModel in
			[RG552]* ) break;;
			[ODIN]* ) break;;
			[RP2+]* ) break;;
			[ANDROID]* ) break;;
			* ) echo "Please answer yes or no.";;
		esac
	 done
	 echo $handheldModel > ~/emudeck/.device
fi
#Handheld detector
handheldModel=$(cat ~/emudeck/.device)

useInternalStorage=false
FILE=~/emudeck/.storageInternal
if [ -f "$FILE" ]; then
	useInternalStorage=true
	storageLocation="shared/Emulation/roms"
else
	useInternalStorage=false
	storageLocation="external-1"
	
fi
#cat ~/emudeck/backend/logo.ans
version=$(cat ~/emudeck/backend/version.md)
#Detect installed emulators
hasRetroArch64=false
#Retroarch 64?
FOLDER64=~/storage/shared/Android/data/com.retroarch.aarch64
if [ -d "$FOLDER64" ]; then
	hasRetroArch64=true
fi
#update scripts
echo -ne  "Updating Scripts..."
pkg install git wget jq rsync unzip whiptail binutils build-essential liblz4 libuv ninja -y  &>> ~/storage/shared/emudeck.log
echo "/bin/bash ~/startup.sh" > ~/.bashrc
echo -e "${GREEN}OK${NONE}"
echo "### Updating scripts "  &>> ~/storage/shared/emudeck.log

echo -ne  "Updating Bundled Themes (won't affect any other themes)..."

FOLDER=~/storage/shared/pegasus-frontend/themes/RP-epic-noir
if [ -d "$FOLDER" ]; then
	cd ~/emudeck/themes/RP-epic-noir
	git reset --hard &>> ~/storage/shared/emudeck.log 
	git pull &>> ~/storage/shared/emudeck.log 
	
else
	echo -ne "Downloading Pegasus Theme : RP Epic Noir..."
	git clone https://github.com/dragoonDorise/RP-epic-noir.git ~/emudeck/themes/RP-epic-noir &>> ~/storage/shared/emudeck.log
	echo -e "${GREEN}OK${NONE}"
fi

FOLDER=~/storage/shared/pegasus-frontend/themes/RP-switch
if [ -d "$FOLDER" ]; then
	cd ~/emudeck/themes/RP-switch
	git reset --hard &>> ~/storage/shared/emudeck.log 
	git pull &>> ~/storage/shared/emudeck.log 
else
	echo -ne "Downloading Pegasus Theme : RP Switch..."
	#We delete the theme, for previous users
	rm -rf ~/storage/shared/pegasus-frontend/themes/RP-switch &>> ~/storage/shared/emudeck.log
	git clone https://github.com/dragoonDorise/RP-switch.git ~/emudeck/themes/RP-switch &>> ~/storage/shared/emudeck.log
	echo -e "${GREEN}OK${NONE}"
fi

FOLDER=~/storage/shared/pegasus-frontend/themes/retromega
if [ -d "$FOLDER" ]; then
	cd ~/emudeck/themes/retromega
	git reset --hard &>> ~/storage/shared/emudeck.log 
	git pull &>> ~/storage/shared/emudeck.log 
	
else
	echo -ne "Downloading Pegasus Theme : Retro Mega..."
	git clone https://github.com/plaidman/retromega-next.git ~/emudeck/themes/retromega &>> ~/storage/shared/emudeck.log
	echo -e "${GREEN}OK${NONE}"
fi



if [ $handheldModel != 'RP2+' ]; then
	
	FOLDER=~/storage/shared/pegasus-frontend/themes/gameOS
	if [ -d "$FOLDER" ]; then
		cd ~/emudeck/themes/gameOS
		git reset --hard &>> ~/storage/shared/emudeck.log 
		git pull &>> ~/storage/shared/emudeck.log 
		
	else
		echo -ne "Downloading Pegasus Theme : GameOS..."
		git clone https://github.com/PlayingKarrde/gameOS.git ~/emudeck/themes/gameOS &>> ~/storage/shared/emudeck.log
		echo -e "${GREEN}OK${NONE}"
	fi
	
	FOLDER=~/storage/shared/pegasus-frontend/themes/clearOS
	if [ -d "$FOLDER" ]; then
		cd ~/emudeck/themes/clearOS
		git reset --hard &>> ~/storage/shared/emudeck.log 
		git pull &>> ~/storage/shared/emudeck.log 
		
	else
		echo -ne "Downloading Pegasus Theme : ClearOS..."
		git clone https://github.com/PlayingKarrde/clearOS.git ~/emudeck/themes/clearOS &>> ~/storage/shared/emudeck.log
		echo -e "${GREEN}OK${NONE}"
	fi
	
	FOLDER=~/storage/shared/pegasus-frontend/themes/neoretro-dark
	if [ -d "$FOLDER" ]; then
		cd ~/emudeck/themes/neoretro-dark
		git reset --hard &>> ~/storage/shared/emudeck.log 
		git pull &>> ~/storage/shared/emudeck.log 
		
	else
		echo -ne "Downloading Pegasus Theme : NeoRetro Dark..."
		git clone https://github.com/TigraTT-Driver/neoretro-dark.git ~/emudeck/themes/neoretro-dark &>> ~/storage/shared/emudeck.log
		echo -e "${GREEN}OK${NONE}"
	fi
echo "### Themes updated "  &>> ~/storage/shared/emudeck.log

fi

echo "### Rsync the dl themes "  &>> ~/storage/shared/emudeck.log
rsync -r ~/emudeck/themes/ ~/storage/shared/pegasus-frontend/themes/ &>> ~/storage/shared/emudeck.log


echo -e "${GREEN}OK${NONE}"

#Metadata update
echo "### Updating Rom folders "  &>> ~/storage/shared/emudeck.log
echo -ne  "Updating Metadata..."
rsync -r ~/emudeck/backend/roms/ ~/storage/$storageLocation &>> ~/storage/shared/emudeck.log
echo "### Rom folders updated "  &>> ~/storage/shared/emudeck.log

#Retroarch64 support
if [ $hasRetroArch64 == true ]; then	
	find ~/storage/$storageLocation/ -type f -name "*.txt" -exec sed -i -e 's/com.retroarch\//com.retroarch.aarch64\//g' {} \;
	find ~/storage/$storageLocation/ -type f -name "*.txt" -exec sed -i -e 's/-e DATADIR \/data\/data\/com.retroarch/-e DATADIR \/data\/data\/com.retroarch.aarch64/g' {} \;	
	find ~/storage/$storageLocation/ -type f -name "*.txt" -exec sed -i -e 's/.browser.retroactivity/com.retroarch.browser.retroactivity/g' {} \;	
	find ~/storage/$storageLocation/ -type f -name "*.txt" -exec sed -i -e 's/com.retroarch-1/com.retroarch.aarch64-1/g' {} \;	
	echo "### RA64 sed"  &>> ~/storage/shared/emudeck.log
	
fi
#cp ~/emudeck/backend/internal/common/pegasus-frontend/settings.txt ~/storage/shared/pegasus-frontend &>> ~/storage/shared/emudeck.log
cp ~/emudeck/backend/internal/common/pegasus-frontend/game_dirs.txt ~/storage/shared/pegasus-frontend &>> ~/storage/shared/emudeck.log


if [ $useInternalStorage == false ]; then

	#We get the SD Card Volume name
	for entry in /storage/*
 	do
	 	STR=$entry
	 	SUB='-'
	 	if grep -q "$SUB" <<< "$STR"; then
		 	firstString=$entry
			 	secondString=""
		  	sdcardID="${firstString/"/storage/"/"$secondString"}"   
	 	fi
 	done

 	sed -i "s/0000-0000\//${sdcardID}\/Android\/data\/com.termux\/files\//g" ~/storage/shared/pegasus-frontend/game_dirs.txt &>> ~/storage/shared/emudeck.log 

else

	sed -i "s/0000-0000/emulated\/0\/roms\//g" ~/storage/shared/pegasus-frontend/game_dirs.txt &>> ~/storage/shared/emudeck.log

fi
echo -e "${GREEN}OK${NONE}"

echo "### Folder roms Pegasus updated "  &>> ~/storage/shared/emudeck.log


FILE=~/emudeck/.isRG552
if [ -f "$FILE" ]; then
	rm ~/emudeck/.isRG552
	touch ~/emudeck/.device 
	echo 'RG552' > ~/emudeck/.device	
fi

#Emulator check
/bin/bash ~/emudeck/backend/emu_check.sh

#RetroArch Update
echo -ne  "Updating Retroarch Config..."
#RetroArch Configs
/bin/bash ~/emudeck/backend/retroarch_config.sh $handheldModel
/bin/bash ~/emudeck/backend/emus_config.sh

newVersion=$(cat ~/emudeck/backend/version.md)
echo ""
echo -e  "${GREEN}Update Completed${NONE}"
echo ""
echo -e  "${YELLOW}Changelog${NONE}"
cat ~/emudeck/backend/changelog.md
echo ""
echo -e  "Your version was: ${PURPLE}$version${NONE}"
echo -e "Installed version is now: ${GREEN}$newVersion${NONE}"
echo -e ""
echo "### Updated completed"  &>> ~/storage/shared/emudeck.log

echo -e "${YELLOW}REMEMBER TO INSTALL CORES${NONE} If you downloaded new cores.."
echo -e "Go to Retroarch's Main Menu -> Load Core -> Install or Restore a Core"
echo -e "And just select the core you want to install"
echo -e  "Press the ${RED}A button${NONE} to finish"
read pause
am startservice -a com.termux.service_stop com.termux/.app.TermuxService &> /dev/null
