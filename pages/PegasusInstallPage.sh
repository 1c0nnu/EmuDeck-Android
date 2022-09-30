while true; do
	frontend=$(whiptail --title "Choose your frontend" \
   --checklist "Move using your DPAD and select your platforms with the Y button. Press the A button to select." 10 80 4 \
	"PEGASUS" "Pegasus - Automatic configuration, you need to scrap your artwork on a PC" OFF \
	"DAIJISHO" "Daihisho - Needs manual configuration" OFF \
	"DIG" "Dig - Needs manual configuration" OFF \
	"LAUNCHBOX" "Launchbox - Needs manual configuration" OFF \
	"RESET" "Reset Collection - Paid - Needs manual configuration" OFF \
	"ARC" "Arc Browser - Paid - Needs manual configuration" OFF \
   3>&1 1<&2 2>&3)
	case $frontend in
		[PEGASUS]* ) break;;
		[DAIJISHO]* ) break;;
		[DIG]* ) break;;
		[LAUNCHBOX]* ) break;;
		[RESET]* ) break;;
		[ARC]* ) break;;
		* ) echo "Please choose.";;
	esac
 done
 
 case $question in
	 "PEGASUS")
		 setSetting doInstallPegasus true
	 ;;
	 "DAIJISHO")
		 setSetting doInstallDaijisho true
	 ;;
	 "DIG")
		 setSetting doInstallDig true
	 ;;
	 "LAUNCHBOX")
		 setSetting doInstallLaunchbox true
	 ;;
	 "RESET")
		 setSetting doInstallReset true
	 ;;
	 "ARC")
		 setSetting doInstallArc true
	;;	 
	 *)
		 echo "default"
	 ;;
 esac