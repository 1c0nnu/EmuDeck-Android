#!/bin/bash
function changeLine() {
	local KEYWORD=$1; shift
	local REPLACE=$1; shift
	local FILE=$1

	local OLD=$(escapeSedKeyword "$KEYWORD")
	local NEW=$(escapeSedValue "$REPLACE")

	echo "Updating: $FILE"
	echo "Old: "$(cat "$FILE" | grep "^$OLD")
	sed -i "/^${OLD}/c\\${NEW}" "$FILE"
	echo "New: "$(cat "$FILE" | grep "^$OLD")

}
function escapeSedKeyword(){
	local INPUT=$1;
	printf '%s\n' "$INPUT" | sed -e 's/[]\/$*.^[]/\\&/g'
}

function escapeSedValue(){
	local INPUT=$1
	printf '%s\n' "$INPUT" | sed -e 's/[\/&]/\\&/g'
}

function getSetting(){
	local setting=$1
	cut -d "=" -f2 <<< "$(grep -r "^${setting}=" "$emuDecksettingsFile")"
}

function createUpdateSettingsFile(){
	#!/bin/bash

	if [ ! -e "$emuDecksettingsFile" ]; then
		mkdir -p $HOME/storage/shared/emudeck/
		echo "#!/bin/bash"> "$emuDecksettingsFile"
	fi
	local defaultSettingsList=()	
	
#!/bin/bash
	
	defaultSettingsList+=("expert=false");
	defaultSettingsList+=("hasSDCARD=false");
	defaultSettingsList+=("devicePower=0");
	defaultSettingsList+=("deviceAR=169");
	defaultSettingsList+=("android=10");
	defaultSettingsList+=("doSetupRA=false");
	defaultSettingsList+=("doSetupDolphin=false");
	defaultSettingsList+=("doSetupPCSX2=false");
	defaultSettingsList+=("doSetupCitra=false");
	defaultSettingsList+=("doSetupDuck=false");
	defaultSettingsList+=("doSetupPPSSPP=false");
	defaultSettingsList+=("doSetupSkyline=false");
	defaultSettingsList+=("doSetupDrastic=false");
	defaultSettingsList+=("doInstallRA=false");
	defaultSettingsList+=("doInstallDolphin=false");
	defaultSettingsList+=("doInstallPCSX2=false");
	defaultSettingsList+=("doInstallCitra=false");
	defaultSettingsList+=("doInstallDuck=false");
	defaultSettingsList+=("doInstallPPSSPP=false");
	defaultSettingsList+=("doInstallSkyline=false");
	defaultSettingsList+=("doInstallDrastic=false");
	defaultSettingsList+=("RABezels=false");
	defaultSettingsList+=("RAautoSave=false");
	defaultSettingsList+=("emulationPath=$HOME/Emulation");
	defaultSettingsList+=("romsPath=$HOME/Emulation/roms");
	defaultSettingsList+=("toolsPath=$HOME/Emulation/tools");
	defaultSettingsList+=("biosPath=$HOME/Emulation/bios");
	defaultSettingsList+=("savesPath=$HOME/Emulation/saves");
	defaultSettingsList+=("storagePath=$HOME/Emulation/storage");
	defaultSettingsList+=("achievementsPass=false");
	defaultSettingsList+=("achievementsUser=false");
	defaultSettingsList+=("arClassic3D=43");
	defaultSettingsList+=("arDolphin=43");
	defaultSettingsList+=("arSega=43");
	defaultSettingsList+=("arSnes=43");
	defaultSettingsList+=("RAHandClassic2D=false");
	defaultSettingsList+=("RAHandHeldShader=true");
	defaultSettingsList+=("doSetupSaveSync=false");
	defaultSettingsList+=("doInstallPegasus=false");
	defaultSettingsList+=("doInstallDaijisho=false");
	defaultSettingsList+=("doInstallDig=false");
	defaultSettingsList+=("doInstallLaunchbox=false");
	defaultSettingsList+=("doInstallReset=false");
	defaultSettingsList+=("doInstallArc=false");
	defaultSettingsList+=("doInstallThemeEpic=false");
	defaultSettingsList+=("doInstallThemeSwitch=false");
	defaultSettingsList+=("doInstallThemeMega=false");
	defaultSettingsList+=("doInstallThemeGameOS=false");
	defaultSettingsList+=("doInstallThemeNeoRetro=false");
	
	
	tmp=$(mktemp)
	#sort "$emuDecksettingsFile" | uniq -u > "$tmp" && mv "$tmp" "$emuDecksettingsFile"
	
	cat "$emuDecksettingsFile" | awk '!unique[$0]++' > "$tmp" && mv "$tmp" "$emuDecksettingsFile"
	for setting in "${defaultSettingsList[@]}"
		do
			local settingName=$(cut -d "=" -f1 <<< "$setting")
			local settingVal=$(cut -d "=" -f2 <<< "$setting")
			if grep -r "^${settingName}=" "$emuDecksettingsFile" &>/dev/null; then
				echo "Setting: $settingName found. CurrentValue: $(getSetting "$settingName")"
			else
				echo "Setting: $settingName NOT found. adding to $emuDecksettingsFile with default value: $settingVal"
				setSetting "$settingName" "$settingVal"
			fi
		done


}

function setSetting () {
	local var=$1
	local new_val=$2

	settingExists=$(grep -rw "$emuDecksettingsFile" -e "$var")
	if [[ $settingExists == '' ]]; then
		#insert setting to end
		echo "variable not found in settings. Adding $var=$new_val to $emuDecksettingsFile"
		sed -i -e '$a\'"$var=$new_val" "$emuDecksettingsFile"
		#'nova fix
	elif [[ ! $settingExists == '' ]]; then
		echo "Old value $settingExists"
			if [[ $settingExists == "$var=$new_val" ]]; then
				echo "Setting unchanged, skipping"
			else
				changeLine "$var=" "$var=$new_val" "$emuDecksettingsFile"
			fi
	fi
	#Update values
	# shellcheck source=settings.sh
	source "$emuDecksettingsFile"
}

function setMSG(){
	echo $1
}


configEmuFP(){		
	
	name=$1
	ID=$2
	overwrite=$3
	
	if [[ $overwrite == 'true' ]]; then
		overwrite="--backup --suffix=.bak"
	else
		overwrite="--ignore-existing"
	fi	
	setMSG "Updating $name Config using $overwrite"	
	
	rsync -avhp --mkpath "$EMUDECKGIT/configs/${ID}" "$ID" $overwrite
	

}

function getLatestReleaseURLGH(){	
	local repository=$1
	local fileType=$2
	local url	
	#local token=$(tokenGenerator)
# 
# 	if [ "$url" == "" ]; then
# 		url="https://api.github.com/repos/${repository}/releases/latest"
# 	fi
# 
# 	url="$(curl -sL $url | jq -r ".assets[].browser_download_url" | grep .${fileType}\$)"
# 	echo "$url"
# 		
	if [ "$url" == "" ]; then
		url="https://api.github.com/repos/$repository/releases"
	fi
	curl -fSs "$url" | \
	jq -r '[ .[].assets[] | select(.name | endswith("'"$fileType"'")).browser_download_url ][0]'	
}

function updateOrAppendConfigLine(){
	local configFile=$1
	local option=$2
	local replacement=$3

	local fullPath=$(dirname "$configFile")
	mkdir -p "$fullPath"
	touch "$configFile"
	
	local optionFound=$(grep -rnw  "$configFile" -e "$option")
	if [[ "$optionFound" == '' ]]; then
		echo "appending: $replacement to $configFile"
		echo "$replacement" >> "$configFile"
	else
		changeLine "$option" "$replacement" "$configFile"
	fi
}