#!/bin/bash
emuDecksettingsFile="$HOME"/storage/shared/emudeck/settings.sh

NEWT_COLORS='
	root=white,cyan
	border=cyan,lightgray
	window=lightgray,lightgray
	shadow=cyan,gray
	title=black,lightgray
	button=black,cyan
	actbutton=white,cyan
	compactbutton=black,lightgray
	checkbox=black,lightgray
	actcheckbox=lightgray,cyan
	entry=black,lightgray
	disentry=gray,lightgray
	label=black,lightgray
	listbox=black,lightgray
	actlistbox=black,cyan
	sellistbox=lightgray,cyan
	actsellistbox=lightgray,cyan
	textbox=black,lightgray
	acttextbox=black,cyan
	emptyscale=,gray
	fullscale=,cyan
	helpline=white,cyan
	roottext=lightgrey,cyan
'
export NEWT_COLORS=$NEWT_COLORS

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

#Frontend Scripts
source "$EMUDECKGIT"/functions/FrontendScripts/EmuDeckArc.sh
source "$EMUDECKGIT"/functions/FrontendScripts/EmuDeckDaijishou.sh
source "$EMUDECKGIT"/functions/FrontendScripts/EmuDeckDig.sh
source "$EMUDECKGIT"/functions/FrontendScripts/EmuDeckLaunchbox.sh
source "$EMUDECKGIT"/functions/FrontendScripts/EmuDeckPegasus.sh
source "$EMUDECKGIT"/functions/FrontendScripts/EmuDeckResetCollection.sh