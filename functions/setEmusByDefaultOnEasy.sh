#!/bin/sh
case $devicePower in
	"1")	
		setSetting doSetupDolphin true
		setSetting doSetupPCSX2 true
		setSetting doSetupCitra true
		setSetting doInstallDolphin true
		setSetting doInstallPCSX2 true
		setSetting doInstallCitra true
	;;
	"2")	
		setSetting doInstallSkyline true
		setSetting doSetupSkyline true
	;;
	*)
  		echo "default"
	;;
esac

#Common to all systems
setSetting doSetupRA true
setSetting doSetupDuck true
setSetting doSetupPPSSPP true
setSetting doInstallRA true
setSetting doInstallDuck true
setSetting doInstallPPSSPP true
setSetting doSetupDrastic true
setSetting doSetupDrastic true

