#!/bin/sh

if [ $android <= 10 ]; then
	question=$(whiptail --title "RetroAchievments" \
	--inputbox "Do you want to configure RetroAchievments? Insert your username..." 10 80 4 \
	3>&1 1<&2 2>&3)
	status=$?
	
	if [ $status = 0 ]; then
		setSetting achievementsUser $question
		question=$(whiptail --title "RetroAchievments" \
		--inputbox "...and your password" 10 80 4 \
		3>&1 1<&2 2>&3)
		status=$?
		if [ $status = 0 ]; then
			setSetting achievementsUser $question
		fi
		
	fi
fi