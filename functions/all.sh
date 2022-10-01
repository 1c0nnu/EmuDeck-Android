#!/bin/bash
emuDecksettingsFile="$HOME"/storage/shared/emudeck/settings.sh

# export NEWT_COLORS='
# window=,red
# border=white,red
# textbox=white,red
# button=black,white
# '

#Settings
if [ -f "$emuDecksettingsFile" ]; then
	# shellcheck source=./settings.sh
	source "$emuDecksettingsFile"
else
	cp "$EMUDECKGIT/settings.sh" "$emuDecksettingsFile"
fi

#Functions
source "$EMUDECKGIT"/functions/helpers.sh
source "$EMUDECKGIT"/functions/setupTermux.sh
source "$EMUDECKGIT"/functions/setEmusByDefaultOnEasy.sh
source "$EMUDECKGIT"/functions/checkEmus.sh

#EmuScripts
source "$EMUDECKGIT"/functions/EmuScripts/emuDeckDolphin.sh

source "$EMUDECKGIT"/functions/EmuScripts/emuDeckCitra.sh
source "$EMUDECKGIT"/functions/EmuScripts/emuDeckDolphin.sh
source "$EMUDECKGIT"/functions/EmuScripts/emuDeckDuckStation.sh
source "$EMUDECKGIT"/functions/EmuScripts/emuDeckPcsx2.sh
source "$EMUDECKGIT"/functions/EmuScripts/emuDeckPPSSPP.sh
source "$EMUDECKGIT"/functions/EmuScripts/emuDeckSkyline.sh
source "$EMUDECKGIT"/functions/EmuScripts/emuDeckRetroArch.sh