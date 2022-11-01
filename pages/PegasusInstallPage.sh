	frontends=$(whiptail --title "Choose your Frontend" \
   --checklist "Move using your DPAD and select your platforms with the Y button. Press the A button to select." 10 80 4 \
	"PEGASUS" "Pegasus - Automatic configuration" OFF \
	"DAIJISHO" "Daihisho - Needs manual configuration" OFF \
	"DIG" "Dig - Needs manual configuration" OFF \
	"LAUNCHBOX" "Launchbox - Needs manual configuration" OFF \
	"RESET" "Reset Collection - Paid - Needs manual configuration" OFF \
	"ARC" "Arc Browser - Paid - Needs manual configuration" OFF \
   3>&1 1<&2 2>&3)
 
 mapfile -t settingsFrontends <<< $frontends
 
 for settingsFrontend in ${settingsFrontends[@]};
  do
	  if [[ $settingsFrontend == *"PEGASUS"* ]]; then
		 setSetting doInstallPegasus true
	 fi
	 if [[ $settingsFrontend == *"DAIJISHO"* ]]; then
		 setSetting doInstallDaijisho true
	 fi
	 if [[ $settingsFrontend == *"DIG"* ]]; then
		 setSetting doInstallDig true
	 fi
	 if [[ $settingsFrontend == *"LAUNCHBOX"* ]]; then
		 setSetting doInstallLaunchbox true
	 fi
	 if [[ $settingsFrontend == *"RESET"* ]]; then
		 setSetting doInstallReset true
	 fi
	 if [[ $settingsFrontend == *"ARC"* ]]; then
		 setSetting doInstallArc true
	 fi
  done
