#!/bin/bash
emuDecksettingsFile="$HOME/storage/shared/emudeck/settings.sh"

export NEWT_COLORS='
window=,red
border=white,red
textbox=white,red
button=black,white
'

#Settings
if [ -f "emuDecksettingsFile" ]; then
	# shellcheck source=./settings.sh
	source "$emuDecksettingsFile"
else
	cp "$EMUDECKGIT/settings.sh" "$emuDecksettingsFile"
fi

#Functions
source "functions/helpers.sh"
source "functions/setupTermux.sh"
source "functions/setEmusByDefaultOnEasy.sh"