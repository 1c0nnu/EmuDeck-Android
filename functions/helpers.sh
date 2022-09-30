function createUpdateSettingsFile(){
	#!/bin/bash

	if [ ! -e "$emuDecksettingsFile" ]; then
		echo "#!/bin/bash"> "$emuDecksettingsFile"
	fi
	local defaultSettingsList=()	
	defaultSettingsList+=("doSetupRA=true")
	defaultSettingsList+=("doSetupDolphin=true")
	defaultSettingsList+=("doSetupPCSX2=true")		
	defaultSettingsList+=("doSetupCitra=true")
	defaultSettingsList+=("doSetupDuck=true")
	defaultSettingsList+=("doSetupRyujinx=true")
	defaultSettingsList+=("doSetupPPSSPP=true")
	#defaultSettingsList+=("doSetupMelon=true")
	defaultSettingsList+=("doInstallRA=true")
	defaultSettingsList+=("doInstallDolphin=true")
	defaultSettingsList+=("doInstallPCSX2=true")
	defaultSettingsList+=("doInstallCitra=true")
	defaultSettingsList+=("doInstallDuck=true")
	defaultSettingsList+=("doInstallPPSSPP=true")
	#defaultSettingsList+=("doInstallMelon=false")
	defaultSettingsList+=("RABezels=true")
	defaultSettingsList+=("RAautoSave=false")
	defaultSettingsList+=("emulationPath=$HOME/Emulation")
	defaultSettingsList+=("romsPath=$HOME/Emulation/roms")
	defaultSettingsList+=("toolsPath=$HOME/Emulation/tools")
	defaultSettingsList+=("biosPath=$HOME/Emulation/bios")
	defaultSettingsList+=("savesPath=$HOME/Emulation/saves")
	defaultSettingsList+=("storagePath=$HOME/Emulation/storage")
	defaultSettingsList+=("esdeTheme=EPICNOIR")
	defaultSettingsList+=("achievementsPass=false")
	defaultSettingsList+=("achievementsUser=false")
	defaultSettingsList+=("arClassic3D=43")
	defaultSettingsList+=("arDolphin=43")
	defaultSettingsList+=("arSega=43")
	defaultSettingsList+=("arSnes=43")
	defaultSettingsList+=("RAHandClassic2D=false")
	defaultSettingsList+=("RAHandHeldShader=false")

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