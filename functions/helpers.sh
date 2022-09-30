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
	defaultSettingsList+=("expert=false");
	defaultSettingsList+=("hasSDCARD=false");
	defaultSettingsList+=("devicePower=0");
	defaultSettingsList+=("deviceAR=169");
	defaultSettingsList+=("android=10");
	defaultSettingsList+=("doSetupRA=true");
	defaultSettingsList+=("doSetupDolphin=true");
	defaultSettingsList+=("doSetupPCSX2=true");
	defaultSettingsList+=("doSetupCitra=true");
	defaultSettingsList+=("doSetupDuck=true");
	defaultSettingsList+=("doSetupPPSSPP=true");
	defaultSettingsList+=("doInstallRA=false");
	defaultSettingsList+=("doInstallDolphin=false");
	defaultSettingsList+=("doInstallPCSX2=false");
	defaultSettingsList+=("doInstallCitra=false");
	defaultSettingsList+=("doInstallDuck=false");
	defaultSettingsList+=("doInstallPPSSPP=false");
	defaultSettingsList+=("RABezels=true");
	defaultSettingsList+=("RAautoSave=false");
	defaultSettingsList+=("emulationPath=~/Emulation");
	defaultSettingsList+=("romsPath=~/Emulation/roms");
	defaultSettingsList+=("toolsPath=~/Emulation/tools");
	defaultSettingsList+=("biosPath=~/Emulation/bios");
	defaultSettingsList+=("savesPath=~/Emulation/saves");
	defaultSettingsList+=("storagePath=~/Emulation/storage");
	defaultSettingsList+=("achievementsPass=false");
	defaultSettingsList+=("achievementsUser=false");
	defaultSettingsList+=("arClassic3D=43");
	defaultSettingsList+=("arDolphin=43");
	defaultSettingsList+=("arSega=43");
	defaultSettingsList+=("arSnes=43");
	defaultSettingsList+=("RAHandClassic2D=false");
	defaultSettingsList+=("RAHandHeldShader=true");
	defaultSettingsList+=("doSetupSaveSync=false");
	

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